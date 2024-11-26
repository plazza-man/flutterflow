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

import 'package:geolocator/geolocator.dart';

Future<bool> checkLocationPermission() async {
  // Check the current location permission status
  LocationPermission permission = await Geolocator.checkPermission();

  // If permission is granted (either always or while using the app),
  if (permission == LocationPermission.always ||
      permission == LocationPermission.whileInUse) {
    return true;
  }

  // If permission is denied, request permission
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
  }

  // If permission is denied forever, inform the user or handle accordingly
  if (permission == LocationPermission.deniedForever) {
    // You can show a dialog or redirect to app settings
    return false;
  }

  // In case permission is restricted or still denied
  return false;
}
