// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartDetailsStruct extends FFFirebaseStruct {
  CartDetailsStruct({
    String? orderid,
    int? ticketid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderid = orderid,
        _ticketid = ticketid,
        super(firestoreUtilData);

  // "orderid" field.
  String? _orderid;
  String get orderid => _orderid ?? '';
  set orderid(String? val) => _orderid = val;

  bool hasOrderid() => _orderid != null;

  // "ticketid" field.
  int? _ticketid;
  int get ticketid => _ticketid ?? 0;
  set ticketid(int? val) => _ticketid = val;

  void incrementTicketid(int amount) => ticketid = ticketid + amount;

  bool hasTicketid() => _ticketid != null;

  static CartDetailsStruct fromMap(Map<String, dynamic> data) =>
      CartDetailsStruct(
        orderid: data['orderid'] as String?,
        ticketid: castToType<int>(data['ticketid']),
      );

  static CartDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? CartDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'orderid': _orderid,
        'ticketid': _ticketid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderid': serializeParam(
          _orderid,
          ParamType.String,
        ),
        'ticketid': serializeParam(
          _ticketid,
          ParamType.int,
        ),
      }.withoutNulls;

  static CartDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartDetailsStruct(
        orderid: deserializeParam(
          data['orderid'],
          ParamType.String,
          false,
        ),
        ticketid: deserializeParam(
          data['ticketid'],
          ParamType.int,
          false,
        ),
      );

  static CartDetailsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      CartDetailsStruct(
        orderid: convertAlgoliaParam(
          data['orderid'],
          ParamType.String,
          false,
        ),
        ticketid: convertAlgoliaParam(
          data['ticketid'],
          ParamType.int,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'CartDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartDetailsStruct &&
        orderid == other.orderid &&
        ticketid == other.ticketid;
  }

  @override
  int get hashCode => const ListEquality().hash([orderid, ticketid]);
}

CartDetailsStruct createCartDetailsStruct({
  String? orderid,
  int? ticketid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartDetailsStruct(
      orderid: orderid,
      ticketid: ticketid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartDetailsStruct? updateCartDetailsStruct(
  CartDetailsStruct? cartDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartDetailsStructData(
  Map<String, dynamic> firestoreData,
  CartDetailsStruct? cartDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartDetails == null) {
    return;
  }
  if (cartDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartDetailsData =
      getCartDetailsFirestoreData(cartDetails, forFieldValue);
  final nestedData =
      cartDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartDetailsFirestoreData(
  CartDetailsStruct? cartDetails, [
  bool forFieldValue = false,
]) {
  if (cartDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartDetails.toMap());

  // Add any Firestore field values
  cartDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartDetailsListFirestoreData(
  List<CartDetailsStruct>? cartDetailss,
) =>
    cartDetailss?.map((e) => getCartDetailsFirestoreData(e, true)).toList() ??
    [];
