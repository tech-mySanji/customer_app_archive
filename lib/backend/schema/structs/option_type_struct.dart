// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OptionTypeStruct extends FFFirebaseStruct {
  OptionTypeStruct({
    String? optionName,
    String? productId,
    int? index,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _optionName = optionName,
        _productId = productId,
        _index = index,
        super(firestoreUtilData);

  // "optionName" field.
  String? _optionName;
  String get optionName => _optionName ?? '';
  set optionName(String? val) => _optionName = val;
  bool hasOptionName() => _optionName != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  set productId(String? val) => _productId = val;
  bool hasProductId() => _productId != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  static OptionTypeStruct fromMap(Map<String, dynamic> data) =>
      OptionTypeStruct(
        optionName: data['optionName'] as String?,
        productId: data['productId'] as String?,
        index: castToType<int>(data['index']),
      );

  static OptionTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? OptionTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'optionName': _optionName,
        'productId': _productId,
        'index': _index,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'optionName': serializeParam(
          _optionName,
          ParamType.String,
        ),
        'productId': serializeParam(
          _productId,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
      }.withoutNulls;

  static OptionTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      OptionTypeStruct(
        optionName: deserializeParam(
          data['optionName'],
          ParamType.String,
          false,
        ),
        productId: deserializeParam(
          data['productId'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'OptionTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is OptionTypeStruct &&
        optionName == other.optionName &&
        productId == other.productId &&
        index == other.index;
  }

  @override
  int get hashCode => const ListEquality().hash([optionName, productId, index]);
}

OptionTypeStruct createOptionTypeStruct({
  String? optionName,
  String? productId,
  int? index,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OptionTypeStruct(
      optionName: optionName,
      productId: productId,
      index: index,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OptionTypeStruct? updateOptionTypeStruct(
  OptionTypeStruct? optionType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    optionType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOptionTypeStructData(
  Map<String, dynamic> firestoreData,
  OptionTypeStruct? optionType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (optionType == null) {
    return;
  }
  if (optionType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && optionType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final optionTypeData = getOptionTypeFirestoreData(optionType, forFieldValue);
  final nestedData = optionTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = optionType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOptionTypeFirestoreData(
  OptionTypeStruct? optionType, [
  bool forFieldValue = false,
]) {
  if (optionType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(optionType.toMap());

  // Add any Firestore field values
  optionType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOptionTypeListFirestoreData(
  List<OptionTypeStruct>? optionTypes,
) =>
    optionTypes?.map((e) => getOptionTypeFirestoreData(e, true)).toList() ?? [];
