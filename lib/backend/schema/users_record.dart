import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "pro_com" field.
  bool? _proCom;
  bool get proCom => _proCom ?? false;
  bool hasProCom() => _proCom != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "spouse" field.
  PersonDetailsStruct? _spouse;
  PersonDetailsStruct get spouse => _spouse ?? PersonDetailsStruct();
  bool hasSpouse() => _spouse != null;

  // "child" field.
  List<PersonDetailsStruct>? _child;
  List<PersonDetailsStruct> get child => _child ?? const [];
  bool hasChild() => _child != null;

  // "dob" field.
  String? _dob;
  String get dob => _dob ?? '';
  bool hasDob() => _dob != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  bool hasHeight() => _height != null;

  // "weight" field.
  String? _weight;
  String get weight => _weight ?? '';
  bool hasWeight() => _weight != null;

  // "smoke" field.
  String? _smoke;
  String get smoke => _smoke ?? '';
  bool hasSmoke() => _smoke != null;

  // "insulin" field.
  String? _insulin;
  String get insulin => _insulin ?? '';
  bool hasInsulin() => _insulin != null;

  // "medication_regularly" field.
  String? _medicationRegularly;
  String get medicationRegularly => _medicationRegularly ?? '';
  bool hasMedicationRegularly() => _medicationRegularly != null;

  // "spouse_current_ypreganant" field.
  String? _spouseCurrentYpreganant;
  String get spouseCurrentYpreganant => _spouseCurrentYpreganant ?? '';
  bool hasSpouseCurrentYpreganant() => _spouseCurrentYpreganant != null;

  // "child_aged_up3" field.
  String? _childAgedUp3;
  String get childAgedUp3 => _childAgedUp3 ?? '';
  bool hasChildAgedUp3() => _childAgedUp3 != null;

  // "monthly_spend" field.
  String? _monthlySpend;
  String get monthlySpend => _monthlySpend ?? '';
  bool hasMonthlySpend() => _monthlySpend != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _proCom = snapshotData['pro_com'] as bool?;
    _gender = snapshotData['gender'] as String?;
    _spouse = PersonDetailsStruct.maybeFromMap(snapshotData['spouse']);
    _child = getStructList(
      snapshotData['child'],
      PersonDetailsStruct.fromMap,
    );
    _dob = snapshotData['dob'] as String?;
    _height = snapshotData['height'] as String?;
    _weight = snapshotData['weight'] as String?;
    _smoke = snapshotData['smoke'] as String?;
    _insulin = snapshotData['insulin'] as String?;
    _medicationRegularly = snapshotData['medication_regularly'] as String?;
    _spouseCurrentYpreganant =
        snapshotData['spouse_current_ypreganant'] as String?;
    _childAgedUp3 = snapshotData['child_aged_up3'] as String?;
    _monthlySpend = snapshotData['monthly_spend'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  LatLng? location,
  bool? proCom,
  String? gender,
  PersonDetailsStruct? spouse,
  String? dob,
  String? height,
  String? weight,
  String? smoke,
  String? insulin,
  String? medicationRegularly,
  String? spouseCurrentYpreganant,
  String? childAgedUp3,
  String? monthlySpend,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'location': location,
      'pro_com': proCom,
      'gender': gender,
      'spouse': PersonDetailsStruct().toMap(),
      'dob': dob,
      'height': height,
      'weight': weight,
      'smoke': smoke,
      'insulin': insulin,
      'medication_regularly': medicationRegularly,
      'spouse_current_ypreganant': spouseCurrentYpreganant,
      'child_aged_up3': childAgedUp3,
      'monthly_spend': monthlySpend,
      'name': name,
    }.withoutNulls,
  );

  // Handle nested data for "spouse" field.
  addPersonDetailsStructData(firestoreData, spouse, 'spouse');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.location == e2?.location &&
        e1?.proCom == e2?.proCom &&
        e1?.gender == e2?.gender &&
        e1?.spouse == e2?.spouse &&
        listEquality.equals(e1?.child, e2?.child) &&
        e1?.dob == e2?.dob &&
        e1?.height == e2?.height &&
        e1?.weight == e2?.weight &&
        e1?.smoke == e2?.smoke &&
        e1?.insulin == e2?.insulin &&
        e1?.medicationRegularly == e2?.medicationRegularly &&
        e1?.spouseCurrentYpreganant == e2?.spouseCurrentYpreganant &&
        e1?.childAgedUp3 == e2?.childAgedUp3 &&
        e1?.monthlySpend == e2?.monthlySpend &&
        e1?.name == e2?.name;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.location,
        e?.proCom,
        e?.gender,
        e?.spouse,
        e?.child,
        e?.dob,
        e?.height,
        e?.weight,
        e?.smoke,
        e?.insulin,
        e?.medicationRegularly,
        e?.spouseCurrentYpreganant,
        e?.childAgedUp3,
        e?.monthlySpend,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
