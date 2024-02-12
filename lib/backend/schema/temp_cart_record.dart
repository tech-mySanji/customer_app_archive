import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TempCartRecord extends FirestoreRecord {
  TempCartRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prodId" field.
  String? _prodId;
  String get prodId => _prodId ?? '';
  bool hasProdId() => _prodId != null;

  // "prodName" field.
  String? _prodName;
  String get prodName => _prodName ?? '';
  bool hasProdName() => _prodName != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "vendorId" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  bool hasVendorId() => _vendorId != null;

  // "deliveryAgentId" field.
  String? _deliveryAgentId;
  String get deliveryAgentId => _deliveryAgentId ?? '';
  bool hasDeliveryAgentId() => _deliveryAgentId != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  bool hasUnit() => _unit != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _prodId = snapshotData['prodId'] as String?;
    _prodName = snapshotData['prodName'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _price = castToType<double>(snapshotData['price']);
    _vendorId = snapshotData['vendorId'] as String?;
    _deliveryAgentId = snapshotData['deliveryAgentId'] as String?;
    _unit = snapshotData['unit'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tempCart')
          : FirebaseFirestore.instance.collectionGroup('tempCart');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tempCart').doc(id);

  static Stream<TempCartRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TempCartRecord.fromSnapshot(s));

  static Future<TempCartRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TempCartRecord.fromSnapshot(s));

  static TempCartRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TempCartRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TempCartRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TempCartRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TempCartRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TempCartRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTempCartRecordData({
  String? prodId,
  String? prodName,
  double? quantity,
  double? price,
  String? vendorId,
  String? deliveryAgentId,
  String? unit,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prodId': prodId,
      'prodName': prodName,
      'quantity': quantity,
      'price': price,
      'vendorId': vendorId,
      'deliveryAgentId': deliveryAgentId,
      'unit': unit,
    }.withoutNulls,
  );

  return firestoreData;
}

class TempCartRecordDocumentEquality implements Equality<TempCartRecord> {
  const TempCartRecordDocumentEquality();

  @override
  bool equals(TempCartRecord? e1, TempCartRecord? e2) {
    return e1?.prodId == e2?.prodId &&
        e1?.prodName == e2?.prodName &&
        e1?.quantity == e2?.quantity &&
        e1?.price == e2?.price &&
        e1?.vendorId == e2?.vendorId &&
        e1?.deliveryAgentId == e2?.deliveryAgentId &&
        e1?.unit == e2?.unit;
  }

  @override
  int hash(TempCartRecord? e) => const ListEquality().hash([
        e?.prodId,
        e?.prodName,
        e?.quantity,
        e?.price,
        e?.vendorId,
        e?.deliveryAgentId,
        e?.unit
      ]);

  @override
  bool isValidKey(Object? o) => o is TempCartRecord;
}
