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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getDistanceMatrix(
  List<LatLng> latlnglist,
  LatLng? latlngsingle,
) async {
  // Ensure the API key is set
  String apiKey =
      "Q5XTelKPwPTAe5qLqMg4dGYHDOwACLYf5X34TPEu"; // Replace with your actual API key

  // Construct the base URL
  String url =
      "https://maps.googleapis.com/maps/api/distancematrix/json?origins=";

  // Add latlnglist origins to the URL
  url += latlnglist
      .map((latlng) => "${latlng.latitude},${latlng.longitude}")
      .join('|');

  // Add the destination (latlngsingle)
  if (latlngsingle != null) {
    url += "&destinations=${latlngsingle.latitude},${latlngsingle.longitude}";
  }

  // Append the API key
  url += "&key=$apiKey";

  // Make the API request
  final response = await http.get(Uri.parse(url));

  // Check for a successful response
  if (response.statusCode == 200) {
    var data = json.decode(response.body);

    if (data['rows'].isNotEmpty && data['rows'][0]['elements'].isNotEmpty) {
      // Extract distance from response
      String distance = data['rows'][0]['elements'][0]['distance']['text'];
      return distance;
    } else {
      throw Exception('No distance data found.');
    }
  } else {
    throw Exception(
        'Failed to load distance matrix. Status code: ${response.statusCode}');
  }
}

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}
