// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LocationStruct extends FFFirebaseStruct {
  LocationStruct({
    double? lng,
    double? lat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lng = lng,
        _lat = lat,
        super(firestoreUtilData);

  // "lng" field.
  double? _lng;
  double get lng => _lng ?? 0.0;
  set lng(double? val) => _lng = val;

  void incrementLng(double amount) => lng = lng + amount;

  bool hasLng() => _lng != null;

  // "lat" field.
  double? _lat;
  double get lat => _lat ?? 0.0;
  set lat(double? val) => _lat = val;

  void incrementLat(double amount) => lat = lat + amount;

  bool hasLat() => _lat != null;

  static LocationStruct fromMap(Map<String, dynamic> data) => LocationStruct(
        lng: castToType<double>(data['lng']),
        lat: castToType<double>(data['lat']),
      );

  static LocationStruct? maybeFromMap(dynamic data) =>
      data is Map ? LocationStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'lng': _lng,
        'lat': _lat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lng': serializeParam(
          _lng,
          ParamType.double,
        ),
        'lat': serializeParam(
          _lat,
          ParamType.double,
        ),
      }.withoutNulls;

  static LocationStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationStruct(
        lng: deserializeParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        lat: deserializeParam(
          data['lat'],
          ParamType.double,
          false,
        ),
      );

  static LocationStruct fromAlgoliaData(Map<String, dynamic> data) =>
      LocationStruct(
        lng: convertAlgoliaParam(
          data['lng'],
          ParamType.double,
          false,
        ),
        lat: convertAlgoliaParam(
          data['lat'],
          ParamType.double,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'LocationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationStruct && lng == other.lng && lat == other.lat;
  }

  @override
  int get hashCode => const ListEquality().hash([lng, lat]);
}

LocationStruct createLocationStruct({
  double? lng,
  double? lat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationStruct(
      lng: lng,
      lat: lat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationStruct? updateLocationStruct(
  LocationStruct? location, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    location
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationStructData(
  Map<String, dynamic> firestoreData,
  LocationStruct? location,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (location == null) {
    return;
  }
  if (location.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && location.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationData = getLocationFirestoreData(location, forFieldValue);
  final nestedData = locationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = location.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationFirestoreData(
  LocationStruct? location, [
  bool forFieldValue = false,
]) {
  if (location == null) {
    return {};
  }
  final firestoreData = mapToFirestore(location.toMap());

  // Add any Firestore field values
  location.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationListFirestoreData(
  List<LocationStruct>? locations,
) =>
    locations?.map((e) => getLocationFirestoreData(e, true)).toList() ?? [];
