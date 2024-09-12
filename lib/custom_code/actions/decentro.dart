// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> decentro(String mobileNo) async {
  // API endpoint for Aadhaar verification
  final String url = 'https://in.decentro.tech/v2/kyc/aadhaar/verify';

  // API key for authentication (replace 'YOUR_API_KEY_HERE' with your actual key)
  final String apiKey = 'fDpve0w6SakqXTwFej0n29vHkE0j5Bbv';

  // Request body for Aadhaar verification
  final Map<String, dynamic> requestBody = {
    'mobile': mobileNo,
    // Add any other required parameters for Aadhaar verification here
  };

  try {
    // Send POST request to Decentro API for Aadhaar verification
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: json.encode(requestBody),
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      // Parse response JSON
      final Map<String, dynamic> responseData = json.decode(response.body);
      // Get the verification status from the response
      final String verificationStatus = responseData['status'];
      return verificationStatus;
    } else {
      // If the response is not successful, return the error message from the response
      return 'Error: ${response.body}';
    }
  } catch (e) {
    // Catch any exceptions (e.g., network issues)
    return 'Error: $e';
  }
}
