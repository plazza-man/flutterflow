// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ContactIdStruct extends FFFirebaseStruct {
  ContactIdStruct({
    String? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _name = name,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static ContactIdStruct fromMap(Map<String, dynamic> data) => ContactIdStruct(
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static ContactIdStruct? maybeFromMap(dynamic data) => data is Map
      ? ContactIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ContactIdStruct fromSerializableMap(Map<String, dynamic> data) =>
      ContactIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  static ContactIdStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ContactIdStruct(
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
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
  String toString() => 'ContactIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ContactIdStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

ContactIdStruct createContactIdStruct({
  String? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ContactIdStruct(
      id: id,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ContactIdStruct? updateContactIdStruct(
  ContactIdStruct? contactId, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    contactId
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addContactIdStructData(
  Map<String, dynamic> firestoreData,
  ContactIdStruct? contactId,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (contactId == null) {
    return;
  }
  if (contactId.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && contactId.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final contactIdData = getContactIdFirestoreData(contactId, forFieldValue);
  final nestedData = contactIdData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = contactId.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getContactIdFirestoreData(
  ContactIdStruct? contactId, [
  bool forFieldValue = false,
]) {
  if (contactId == null) {
    return {};
  }
  final firestoreData = mapToFirestore(contactId.toMap());

  // Add any Firestore field values
  contactId.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getContactIdListFirestoreData(
  List<ContactIdStruct>? contactIds,
) =>
    contactIds?.map((e) => getContactIdFirestoreData(e, true)).toList() ?? [];
