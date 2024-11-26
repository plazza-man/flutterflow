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

import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;

Future<String> getLocation(String lat, String lng) async {
  // Define your API key
  String apiKey = 'Q5XTelKPwPTAe5qLqMg4dGYHDOwACLYf5X34TPEu';

  // Define the API endpoint URL with passed latitude and longitude
  String apiUrl =
      "https://api.olamaps.io/places/v1/reverse-geocode?latlng=$lat,$lng&api_key=$apiKey";

  // Make an HTTP request to the API endpoint
  final response = await http.get(Uri.parse(apiUrl));

  // Check if the response was successful
  if (response.statusCode == 200) {
    // Print full response to check structure
    print("Full Response: ${response.body}");

    // Parse the JSON response
    final data = json.decode(response.body);

    // Check if 'results' exists and has data
    if (data != null &&
        data.containsKey('results') &&
        data['results'].isNotEmpty) {
      // Extract the first result
      final result = data['results'][0];

      // Initialize variables to store location data
      String locality = "";
      String adminAreaLevel3 = "";
      String adminAreaLevel1 = "";

      // Extract the required address components
      for (var component in result['address_components']) {
        if (component['types'].contains('locality')) {
          locality = component['short_name'];
        } else if (component['types'].contains('administrative_area_level_3')) {
          adminAreaLevel3 = component['short_name'];
        } else if (component['types'].contains('administrative_area_level_1')) {
          adminAreaLevel1 = component['short_name'];
        }
      }

      // Build and return the formatted location string
      String location = "$locality, $adminAreaLevel3, $adminAreaLevel1";
      print("Location: $location");
      return location;
    } else {
      // Handle case where no location is found
      print('No location found in response');
      return 'No location found';
    }
  } else {
    // Handle the error
    print("Error: ${response.statusCode}");
    return 'Error: ${response.statusCode}';
  }
}
