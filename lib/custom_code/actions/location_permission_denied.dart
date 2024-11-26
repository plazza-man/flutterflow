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

Future<bool> locationPermissionDenied() async {
  // Check the current location permission status
  LocationPermission permission = await Geolocator.checkPermission();

  // If permission is granted (either always or while using the app)
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

  // Handle deniedForever by sending the user to app settings
  if (permission == LocationPermission.deniedForever) {
    // Inform the user that they need to grant permissions manually
    bool openedSettings = await Geolocator.openAppSettings();
    if (openedSettings) {
      // After returning from settings, check the permission status again
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        return true;
      }
    }
    // Permission not granted even after opening settings
    return false;
  }

  // If permission is still restricted or denied
  return false;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
