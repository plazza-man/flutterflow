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

Future<List<String>> searchLocationByText(String searchText) async {
  // Define your API key
  String apiKey = 'Q5XTelKPwPTAe5qLqMg4dGYHDOwACLYf5X34TPEu';

  // Define the API endpoint URL with the search text
  String apiUrl =
      "https://api.olamaps.io/places/v1/$searchText?input=cafes in koramangala&api_key=$apiKey";

  // Make an HTTP request to the API endpoint
  final response = await http.get(Uri.parse(apiUrl));

  // Check if the response was successful
  if (response.statusCode == 200) {
    // Print full response to check structure
    print("Full Response: ${response.body}");

    // Parse the JSON response
    final data = json.decode(response.body);

    // Initialize a list to store location names
    List<String> locations = [];

    // Check if 'results' exists and has data
    if (data != null &&
        data.containsKey('results') &&
        data['results'].isNotEmpty) {
      // Extract results and add them to the list
      for (var result in data['results']) {
        String locationName = result['address_components'];
        locations.add(locationName);
      }

      // Return the list of locations
      print("Locations: $locations");
      return locations;
    } else {
      // Handle case where no location is found
      print('No location found in response');
      return ['No location found'];
    }
  } else {
    // Handle the error
    print("Error: ${response.statusCode}");
    return ['Error: ${response.statusCode}'];
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
