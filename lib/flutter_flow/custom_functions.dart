import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String milisecondsToSeconds(int miliseconds) {
  double seconds = miliseconds / 1000;
  return seconds.toStringAsFixed(0);
}

String getLng(LatLng latLng) {
  return latLng.longitude.toString();
  // pass latlng return lat
}

String? getTwoDigit(String? displayName) {
  if (displayName == null || displayName.length < 2) {
    return 'AP';
  }

  // Extract the first two characters and convert them to uppercase
  return displayName.substring(0, 2).toUpperCase();
}

String getLet(LatLng latLng) {
  return latLng.latitude.toString();
  // pass latlng return lat
}
