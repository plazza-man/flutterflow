import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start medicineFlow Group Code

class MedicineFlowGroup {
  static String getBaseUrl() => 'http://13.233.164.5/medicines';
  static Map<String, String> headers = {};
  static PrescriptionUploadCall prescriptionUploadCall =
      PrescriptionUploadCall();
}

class PrescriptionUploadCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = MedicineFlowGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'prescriptionUpload',
      apiUrl: '$baseUrl/prescription/upload',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End medicineFlow Group Code

class BibbleCall {
  static Future<ApiCallResponse> call({
    double? lat,
    double? lng,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'bibble',
      apiUrl: 'https://statechange.ai',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadPrescriptionCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    String? fileName = '',
  }) async {
    final ffApiRequestBody = '''
{
  "fileIds": [
    "$fileName"
  ],
  "userId": "$userId"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uploadPrescription',
      apiUrl: 'http://13.233.164.5/medicines/prescription/upload',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DecentroCall {
  static Future<ApiCallResponse> call({
    String? number = '9450490634',
  }) async {
    final ffApiRequestBody = '''
{
  "clientId": "plazza_test",
  "clientSecret": "fDpve0w6SakqXTwFej0n29vHkE0j5Bbv",
  "moduleSecret": "ah4b2Rq76yUDbDPpWIWrt8xNypSAt7JJ",
  "callbackUrl": "http://example.com/callback",
  "redirectUrl": "http://example.com/redirect",
  "additionalData": {
    "mobile": "$number"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Decentro',
      apiUrl: 'http://13.233.164.5/decentro/generate_uistream_session',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
