import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "ticket_id" field.
  int? _ticketId;
  int get ticketId => _ticketId ?? 0;
  bool hasTicketId() => _ticketId != null;

  // "delivery_agent_tracking_url" field.
  String? _deliveryAgentTrackingUrl;
  String get deliveryAgentTrackingUrl => _deliveryAgentTrackingUrl ?? '';
  bool hasDeliveryAgentTrackingUrl() => _deliveryAgentTrackingUrl != null;

  // "delivery_agent_name" field.
  String? _deliveryAgentName;
  String get deliveryAgentName => _deliveryAgentName ?? '';
  bool hasDeliveryAgentName() => _deliveryAgentName != null;

  // "order_source" field.
  String? _orderSource;
  String get orderSource => _orderSource ?? '';
  bool hasOrderSource() => _orderSource != null;

  // "packaging_charges" field.
  int? _packagingCharges;
  int get packagingCharges => _packagingCharges ?? 0;
  bool hasPackagingCharges() => _packagingCharges != null;

  // "platform_fee" field.
  int? _platformFee;
  int get platformFee => _platformFee ?? 0;
  bool hasPlatformFee() => _platformFee != null;

  // "convenience_fee" field.
  int? _convenienceFee;
  int get convenienceFee => _convenienceFee ?? 0;
  bool hasConvenienceFee() => _convenienceFee != null;

  // "delivery_charges" field.
  int? _deliveryCharges;
  int get deliveryCharges => _deliveryCharges ?? 0;
  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "prescription_url_list" field.
  List<String>? _prescriptionUrlList;
  List<String> get prescriptionUrlList => _prescriptionUrlList ?? const [];
  bool hasPrescriptionUrlList() => _prescriptionUrlList != null;

  // "order_created_time" field.
  DateTime? _orderCreatedTime;
  DateTime? get orderCreatedTime => _orderCreatedTime;
  bool hasOrderCreatedTime() => _orderCreatedTime != null;

  // "status" field.
  StatusStruct? _status;
  StatusStruct get status => _status ?? StatusStruct();
  bool hasStatus() => _status != null;

  // "item_total" field.
  double? _itemTotal;
  double get itemTotal => _itemTotal ?? 0.0;
  bool hasItemTotal() => _itemTotal != null;

  // "bill_total_amount" field.
  double? _billTotalAmount;
  double get billTotalAmount => _billTotalAmount ?? 0.0;
  bool hasBillTotalAmount() => _billTotalAmount != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "contact_id" field.
  List<ContactIdStruct>? _contactId;
  List<ContactIdStruct> get contactId => _contactId ?? const [];
  bool hasContactId() => _contactId != null;

  // "deliveryagentphonenumber" field.
  String? _deliveryagentphonenumber;
  String get deliveryagentphonenumber => _deliveryagentphonenumber ?? '';
  bool hasDeliveryagentphonenumber() => _deliveryagentphonenumber != null;

  // "tag_from_address_tag_" field.
  List<String>? _tagFromAddressTag;
  List<String> get tagFromAddressTag => _tagFromAddressTag ?? const [];
  bool hasTagFromAddressTag() => _tagFromAddressTag != null;

  // "fulladdres_from_addressid_" field.
  List<String>? _fulladdresFromAddressid;
  List<String> get fulladdresFromAddressid =>
      _fulladdresFromAddressid ?? const [];
  bool hasFulladdresFromAddressid() => _fulladdresFromAddressid != null;

  void _initializeFields() {
    _ticketId = castToType<int>(snapshotData['ticket_id']);
    _deliveryAgentTrackingUrl =
        snapshotData['delivery_agent_tracking_url'] as String?;
    _deliveryAgentName = snapshotData['delivery_agent_name'] as String?;
    _orderSource = snapshotData['order_source'] as String?;
    _packagingCharges = castToType<int>(snapshotData['packaging_charges']);
    _platformFee = castToType<int>(snapshotData['platform_fee']);
    _convenienceFee = castToType<int>(snapshotData['convenience_fee']);
    _deliveryCharges = castToType<int>(snapshotData['delivery_charges']);
    _prescriptionUrlList = getDataList(snapshotData['prescription_url_list']);
    _orderCreatedTime = snapshotData['order_created_time'] as DateTime?;
    _status = StatusStruct.maybeFromMap(snapshotData['status']);
    _itemTotal = castToType<double>(snapshotData['item_total']);
    _billTotalAmount = castToType<double>(snapshotData['bill_total_amount']);
    _rating = castToType<double>(snapshotData['rating']);
    _contactId = getStructList(
      snapshotData['contact_id'],
      ContactIdStruct.fromMap,
    );
    _deliveryagentphonenumber =
        snapshotData['deliveryagentphonenumber'] as String?;
    _tagFromAddressTag = getDataList(snapshotData['tag_from_address_tag_']);
    _fulladdresFromAddressid =
        getDataList(snapshotData['fulladdres_from_addressid_']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  int? ticketId,
  String? deliveryAgentTrackingUrl,
  String? deliveryAgentName,
  String? orderSource,
  int? packagingCharges,
  int? platformFee,
  int? convenienceFee,
  int? deliveryCharges,
  DateTime? orderCreatedTime,
  StatusStruct? status,
  double? itemTotal,
  double? billTotalAmount,
  double? rating,
  String? deliveryagentphonenumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ticket_id': ticketId,
      'delivery_agent_tracking_url': deliveryAgentTrackingUrl,
      'delivery_agent_name': deliveryAgentName,
      'order_source': orderSource,
      'packaging_charges': packagingCharges,
      'platform_fee': platformFee,
      'convenience_fee': convenienceFee,
      'delivery_charges': deliveryCharges,
      'order_created_time': orderCreatedTime,
      'status': StatusStruct().toMap(),
      'item_total': itemTotal,
      'bill_total_amount': billTotalAmount,
      'rating': rating,
      'deliveryagentphonenumber': deliveryagentphonenumber,
    }.withoutNulls,
  );

  // Handle nested data for "status" field.
  addStatusStructData(firestoreData, status, 'status');

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.ticketId == e2?.ticketId &&
        e1?.deliveryAgentTrackingUrl == e2?.deliveryAgentTrackingUrl &&
        e1?.deliveryAgentName == e2?.deliveryAgentName &&
        e1?.orderSource == e2?.orderSource &&
        e1?.packagingCharges == e2?.packagingCharges &&
        e1?.platformFee == e2?.platformFee &&
        e1?.convenienceFee == e2?.convenienceFee &&
        e1?.deliveryCharges == e2?.deliveryCharges &&
        listEquality.equals(e1?.prescriptionUrlList, e2?.prescriptionUrlList) &&
        e1?.orderCreatedTime == e2?.orderCreatedTime &&
        e1?.status == e2?.status &&
        e1?.itemTotal == e2?.itemTotal &&
        e1?.billTotalAmount == e2?.billTotalAmount &&
        e1?.rating == e2?.rating &&
        listEquality.equals(e1?.contactId, e2?.contactId) &&
        e1?.deliveryagentphonenumber == e2?.deliveryagentphonenumber &&
        listEquality.equals(e1?.tagFromAddressTag, e2?.tagFromAddressTag) &&
        listEquality.equals(
            e1?.fulladdresFromAddressid, e2?.fulladdresFromAddressid);
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.ticketId,
        e?.deliveryAgentTrackingUrl,
        e?.deliveryAgentName,
        e?.orderSource,
        e?.packagingCharges,
        e?.platformFee,
        e?.convenienceFee,
        e?.deliveryCharges,
        e?.prescriptionUrlList,
        e?.orderCreatedTime,
        e?.status,
        e?.itemTotal,
        e?.billTotalAmount,
        e?.rating,
        e?.contactId,
        e?.deliveryagentphonenumber,
        e?.tagFromAddressTag,
        e?.fulladdresFromAddressid
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
