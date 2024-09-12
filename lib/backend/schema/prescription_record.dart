import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PrescriptionRecord extends FirestoreRecord {
  PrescriptionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "prescription" field.
  List<PrescriptionStruct>? _prescription;
  List<PrescriptionStruct> get prescription => _prescription ?? const [];
  bool hasPrescription() => _prescription != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "submited_date" field.
  DateTime? _submitedDate;
  DateTime? get submitedDate => _submitedDate;
  bool hasSubmitedDate() => _submitedDate != null;

  void _initializeFields() {
    _prescription = getStructList(
      snapshotData['prescription'],
      PrescriptionStruct.fromMap,
    );
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _submitedDate = snapshotData['submited_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prescription');

  static Stream<PrescriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PrescriptionRecord.fromSnapshot(s));

  static Future<PrescriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PrescriptionRecord.fromSnapshot(s));

  static PrescriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PrescriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PrescriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PrescriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PrescriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PrescriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPrescriptionRecordData({
  DocumentReference? userRef,
  String? status,
  DateTime? submitedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_ref': userRef,
      'status': status,
      'submited_date': submitedDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class PrescriptionRecordDocumentEquality
    implements Equality<PrescriptionRecord> {
  const PrescriptionRecordDocumentEquality();

  @override
  bool equals(PrescriptionRecord? e1, PrescriptionRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.prescription, e2?.prescription) &&
        e1?.userRef == e2?.userRef &&
        e1?.status == e2?.status &&
        e1?.submitedDate == e2?.submitedDate;
  }

  @override
  int hash(PrescriptionRecord? e) => const ListEquality()
      .hash([e?.prescription, e?.userRef, e?.status, e?.submitedDate]);

  @override
  bool isValidKey(Object? o) => o is PrescriptionRecord;
}
