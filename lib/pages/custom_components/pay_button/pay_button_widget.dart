import '/auth/firebase_auth/auth_util.dart';
import '/backend/razorpay/razorpay_payment_sheet.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'pay_button_model.dart';
export 'pay_button_model.dart';

class PayButtonWidget extends StatefulWidget {
  const PayButtonWidget({super.key});

  @override
  State<PayButtonWidget> createState() => _PayButtonWidgetState();
}

class _PayButtonWidgetState extends State<PayButtonWidget> {
  late PayButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PayButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FFButtonWidget(
            onPressed: () async {
              if (isWeb) {
                context.goNamed('Mambershipkyc1');
              } else {
                await processRazorpayPayment(
                  context,
                  amount: 700,
                  currency: 'INR',
                  receipt:
                      getCurrentTimestamp.microsecondsSinceEpoch.toString(),
                  description: 'no',
                  userName: currentUserDisplayName,
                  userEmail: 'abhijeettiwari521@gmail.com',
                  userContact: currentPhoneNumber,
                  timeout: 30000,
                  onReceivedResponse: (paymentId) =>
                      safeSetState(() => _model.razorpayPaymentId = paymentId),
                );

                context.goNamed('Mambershipkyc1');
              }

              safeSetState(() {});
            },
            text: 'PAY ₹999 / FAMILY / MONTH',
            options: FFButtonOptions(
              width: 430.0,
              height: 50.0,
              padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).plazzaNewPrimaryPink,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Figtree',
                    color: Colors.white,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w200,
                  ),
              elevation: 3.0,
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}
