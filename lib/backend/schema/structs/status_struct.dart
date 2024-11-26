// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class StatusStruct extends FFFirebaseStruct {
  StatusStruct({
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static StatusStruct fromMap(Map<String, dynamic> data) => StatusStruct(
        name: data['name'] as String?,
      );

  static StatusStruct? maybeFromMap(dynamic data) =>
      data is Map ? StatusStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static StatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatusStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  static StatusStruct fromAlgoliaData(Map<String, dynamic> data) =>
      StatusStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'StatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatusStruct && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([name]);
}

StatusStruct createStatusStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatusStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatusStruct? updateStatusStruct(
  StatusStruct? status, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    status
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatusStructData(
  Map<String, dynamic> firestoreData,
  StatusStruct? status,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (status == null) {
    return;
  }
  if (status.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && status.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statusData = getStatusFirestoreData(status, forFieldValue);
  final nestedData = statusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = status.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatusFirestoreData(
  StatusStruct? status, [
  bool forFieldValue = false,
]) {
  if (status == null) {
    return {};
  }
  final firestoreData = mapToFirestore(status.toMap());

  // Add any Firestore field values
  status.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatusListFirestoreData(
  List<StatusStruct>? statuss,
) =>
    statuss?.map((e) => getStatusFirestoreData(e, true)).toList() ?? [];
