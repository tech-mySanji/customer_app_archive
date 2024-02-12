// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemStruct extends FFFirebaseStruct {
  CartItemStruct({
    String? barcode,
    String? productName,
    String? vendorId,
    String? deliveryAgentId,
    String? productId,
    double? sellingPrice,
    String? subCategoryId,
    double? quantity,
    String? unit,
    String? productNameSecondary,
    double? incrementalQuantity,
    double? minimumQuantity,
    DateTime? addedTime,
    String? packageId,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _barcode = barcode,
        _productName = productName,
        _vendorId = vendorId,
        _deliveryAgentId = deliveryAgentId,
        _productId = productId,
        _sellingPrice = sellingPrice,
        _subCategoryId = subCategoryId,
        _quantity = quantity,
        _unit = unit,
        _productNameSecondary = productNameSecondary,
        _incrementalQuantity = incrementalQuantity,
        _minimumQuantity = minimumQuantity,
        _addedTime = addedTime,
        _packageId = packageId,
        _status = status,
        super(firestoreUtilData);

  // "barcode" field.
  String? _barcode;
  String get barcode => _barcode ?? '';
  set barcode(String? val) => _barcode = val;
  bool hasBarcode() => _barcode != null;

  // "product_name" field.
  String? _productName;
  String get productName => _productName ?? '';
  set productName(String? val) => _productName = val;
  bool hasProductName() => _productName != null;

  // "vendor_id" field.
  String? _vendorId;
  String get vendorId => _vendorId ?? '';
  set vendorId(String? val) => _vendorId = val;
  bool hasVendorId() => _vendorId != null;

  // "delivery_agent_id" field.
  String? _deliveryAgentId;
  String get deliveryAgentId => _deliveryAgentId ?? '';
  set deliveryAgentId(String? val) => _deliveryAgentId = val;
  bool hasDeliveryAgentId() => _deliveryAgentId != null;

  // "product_id" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;
  bool hasProductId() => _productId != null;

  // "selling_price" field.
  double? _sellingPrice;
  double get sellingPrice => _sellingPrice ?? 0.0;
  set sellingPrice(double? val) => _sellingPrice = val;
  void incrementSellingPrice(double amount) =>
      _sellingPrice = sellingPrice + amount;
  bool hasSellingPrice() => _sellingPrice != null;

  // "sub_category_id" field.
  String? _subCategoryId;
  String get subCategoryId => _subCategoryId ?? '';
  set subCategoryId(String? val) => _subCategoryId = val;
  bool hasSubCategoryId() => _subCategoryId != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;
  void incrementQuantity(double amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "unit" field.
  String? _unit;
  String get unit => _unit ?? '';
  set unit(String? val) => _unit = val;
  bool hasUnit() => _unit != null;

  // "product_name_secondary" field.
  String? _productNameSecondary;
  String get productNameSecondary => _productNameSecondary ?? '';
  set productNameSecondary(String? val) => _productNameSecondary = val;
  bool hasProductNameSecondary() => _productNameSecondary != null;

  // "incremental_quantity" field.
  double? _incrementalQuantity;
  double get incrementalQuantity => _incrementalQuantity ?? 0.0;
  set incrementalQuantity(double? val) => _incrementalQuantity = val;
  void incrementIncrementalQuantity(double amount) =>
      _incrementalQuantity = incrementalQuantity + amount;
  bool hasIncrementalQuantity() => _incrementalQuantity != null;

  // "minimum_quantity" field.
  double? _minimumQuantity;
  double get minimumQuantity => _minimumQuantity ?? 0.0;
  set minimumQuantity(double? val) => _minimumQuantity = val;
  void incrementMinimumQuantity(double amount) =>
      _minimumQuantity = minimumQuantity + amount;
  bool hasMinimumQuantity() => _minimumQuantity != null;

  // "added_time" field.
  DateTime? _addedTime;
  DateTime? get addedTime => _addedTime;
  set addedTime(DateTime? val) => _addedTime = val;
  bool hasAddedTime() => _addedTime != null;

  // "package_id" field.
  String? _packageId;
  String get packageId => _packageId ?? '';
  set packageId(String? val) => _packageId = val;
  bool hasPackageId() => _packageId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  static CartItemStruct fromMap(Map<String, dynamic> data) => CartItemStruct(
        barcode: data['barcode'] as String?,
        productName: data['product_name'] as String?,
        vendorId: data['vendor_id'] as String?,
        deliveryAgentId: data['delivery_agent_id'] as String?,
        productId: data['product_id'] as String?,
        sellingPrice: castToType<double>(data['selling_price']),
        subCategoryId: data['sub_category_id'] as String?,
        quantity: castToType<double>(data['quantity']),
        unit: data['unit'] as String?,
        productNameSecondary: data['product_name_secondary'] as String?,
        incrementalQuantity: castToType<double>(data['incremental_quantity']),
        minimumQuantity: castToType<double>(data['minimum_quantity']),
        addedTime: data['added_time'] as DateTime?,
        packageId: data['package_id'] as String?,
        status: data['status'] as String?,
      );

  static CartItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'barcode': _barcode,
        'product_name': _productName,
        'vendor_id': _vendorId,
        'delivery_agent_id': _deliveryAgentId,
        'product_id': _productId,
        'selling_price': _sellingPrice,
        'sub_category_id': _subCategoryId,
        'quantity': _quantity,
        'unit': _unit,
        'product_name_secondary': _productNameSecondary,
        'incremental_quantity': _incrementalQuantity,
        'minimum_quantity': _minimumQuantity,
        'added_time': _addedTime,
        'package_id': _packageId,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'barcode': serializeParam(
          _barcode,
          ParamType.String,
        ),
        'product_name': serializeParam(
          _productName,
          ParamType.String,
        ),
        'vendor_id': serializeParam(
          _vendorId,
          ParamType.String,
        ),
        'delivery_agent_id': serializeParam(
          _deliveryAgentId,
          ParamType.String,
        ),
        'product_id': serializeParam(
          _productId,
          ParamType.String,
        ),
        'selling_price': serializeParam(
          _sellingPrice,
          ParamType.double,
        ),
        'sub_category_id': serializeParam(
          _subCategoryId,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'unit': serializeParam(
          _unit,
          ParamType.String,
        ),
        'product_name_secondary': serializeParam(
          _productNameSecondary,
          ParamType.String,
        ),
        'incremental_quantity': serializeParam(
          _incrementalQuantity,
          ParamType.double,
        ),
        'minimum_quantity': serializeParam(
          _minimumQuantity,
          ParamType.double,
        ),
        'added_time': serializeParam(
          _addedTime,
          ParamType.DateTime,
        ),
        'package_id': serializeParam(
          _packageId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemStruct(
        barcode: deserializeParam(
          data['barcode'],
          ParamType.String,
          false,
        ),
        productName: deserializeParam(
          data['product_name'],
          ParamType.String,
          false,
        ),
        vendorId: deserializeParam(
          data['vendor_id'],
          ParamType.String,
          false,
        ),
        deliveryAgentId: deserializeParam(
          data['delivery_agent_id'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['product_id'],
          ParamType.String,
          false,
        ),
        sellingPrice: deserializeParam(
          data['selling_price'],
          ParamType.double,
          false,
        ),
        subCategoryId: deserializeParam(
          data['sub_category_id'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        unit: deserializeParam(
          data['unit'],
          ParamType.String,
          false,
        ),
        productNameSecondary: deserializeParam(
          data['product_name_secondary'],
          ParamType.String,
          false,
        ),
        incrementalQuantity: deserializeParam(
          data['incremental_quantity'],
          ParamType.double,
          false,
        ),
        minimumQuantity: deserializeParam(
          data['minimum_quantity'],
          ParamType.double,
          false,
        ),
        addedTime: deserializeParam(
          data['added_time'],
          ParamType.DateTime,
          false,
        ),
        packageId: deserializeParam(
          data['package_id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CartItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemStruct &&
        barcode == other.barcode &&
        productName == other.productName &&
        vendorId == other.vendorId &&
        deliveryAgentId == other.deliveryAgentId &&
        productId == other.productId &&
        sellingPrice == other.sellingPrice &&
        subCategoryId == other.subCategoryId &&
        quantity == other.quantity &&
        unit == other.unit &&
        productNameSecondary == other.productNameSecondary &&
        incrementalQuantity == other.incrementalQuantity &&
        minimumQuantity == other.minimumQuantity &&
        addedTime == other.addedTime &&
        packageId == other.packageId &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([
        barcode,
        productName,
        vendorId,
        deliveryAgentId,
        productId,
        sellingPrice,
        subCategoryId,
        quantity,
        unit,
        productNameSecondary,
        incrementalQuantity,
        minimumQuantity,
        addedTime,
        packageId,
        status
      ]);
}

CartItemStruct createCartItemStruct({
  String? barcode,
  String? productName,
  String? vendorId,
  String? deliveryAgentId,
  String? productId,
  double? sellingPrice,
  String? subCategoryId,
  double? quantity,
  String? unit,
  String? productNameSecondary,
  double? incrementalQuantity,
  double? minimumQuantity,
  DateTime? addedTime,
  String? packageId,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemStruct(
      barcode: barcode,
      productName: productName,
      vendorId: vendorId,
      deliveryAgentId: deliveryAgentId,
      productId: productId,
      sellingPrice: sellingPrice,
      subCategoryId: subCategoryId,
      quantity: quantity,
      unit: unit,
      productNameSecondary: productNameSecondary,
      incrementalQuantity: incrementalQuantity,
      minimumQuantity: minimumQuantity,
      addedTime: addedTime,
      packageId: packageId,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemStruct? updateCartItemStruct(
  CartItemStruct? cartItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemStructData(
  Map<String, dynamic> firestoreData,
  CartItemStruct? cartItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItem == null) {
    return;
  }
  if (cartItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemData = getCartItemFirestoreData(cartItem, forFieldValue);
  final nestedData = cartItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemFirestoreData(
  CartItemStruct? cartItem, [
  bool forFieldValue = false,
]) {
  if (cartItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItem.toMap());

  // Add any Firestore field values
  cartItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemListFirestoreData(
  List<CartItemStruct>? cartItems,
) =>
    cartItems?.map((e) => getCartItemFirestoreData(e, true)).toList() ?? [];
