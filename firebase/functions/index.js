const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const Razorpay = require("razorpay");
const crypto = require("crypto");

// Test credentials
const kTestKeyId = "rzp_test_CXbZJ7lTt7sYmL";
const kTestKeySecret = "dKitN2u3P1q7sGk8HT36QAb8";

// Prod credentials
const kProdKeyId = "rzp_live_13nfx7eGyPUdLb";
const kProdKeySecret = "z8KFPcSV9G4bzse3LSQ4tqMO";

const keyId = (isProd) => (isProd ? kProdKeyId : kTestKeyId);
const keySecret = (isProd) => (isProd ? kProdKeySecret : kTestKeySecret);

/**
 *
 */
exports.createOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return "Unauthenticated calls are not allowed.";
  }
  return await generateOrder(data, true);
});

/**
 *
 */
exports.testCreateOrder = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return "Unauthenticated calls are not allowed.";
  }
  return await generateOrder(data, false);
});

/**
 *
 */
async function generateOrder(data, isProd) {
  const razorpay = new Razorpay({
    key_id: keyId(isProd),
    key_secret: keySecret(isProd),
  });

  try {
    const order = await razorpay.orders.create({
      amount: data.amount,
      currency: data.currency,
      receipt: data.receipt,
    });

    return order;
  } catch (err) {
    console.error(`${err}`);
    throw new functions.https.HttpsError(
      "aborted",
      "Could not create the order",
    );
  }
}

/**
 *
 */
exports.verifySignature = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return "Unauthenticated calls are not allowed.";
  }
  return isValidSignature(data, true);
});

/**
 *
 */
exports.testVerifySignature = functions.https.onCall(async (data, context) => {
  if (!context.auth) {
    return "Unauthenticated calls are not allowed.";
  }
  return isValidSignature(data, false);
});

/**
 *
 */
function isValidSignature(data, isProd) {
  const hmac = crypto.createHmac("sha256", keySecret(isProd));
  hmac.update(data.orderId + "|" + data.paymentId);
  const generatedSignature = hmac.digest("hex");
  const isSignatureValid = generatedSignature === data.signature;
  return { isValid: isSignatureValid };
}
