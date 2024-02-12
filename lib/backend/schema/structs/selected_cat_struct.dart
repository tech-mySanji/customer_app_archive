// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedCatStruct extends FFFirebaseStruct {
  SelectedCatStruct({
    String? categoryId,
    String? categoryName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _categoryId = categoryId,
        _categoryName = categoryName,
        super(firestoreUtilData);

  // "categoryId" field.
  String? _categoryId;
  String get categoryId => _categoryId ?? '';
  set categoryId(String? val) => _categoryId = val;
  bool hasCategoryId() => _categoryId != null;

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  set categoryName(String? val) => _categoryName = val;
  bool hasCategoryName() => _categoryName != null;

  static SelectedCatStruct fromMap(Map<String, dynamic> data) =>
      SelectedCatStruct(
        categoryId: data['categoryId'] as String?,
        categoryName: data['categoryName'] as String?,
      );

  static SelectedCatStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectedCatStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'categoryId': _categoryId,
        'categoryName': _categoryName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'categoryId': serializeParam(
          _categoryId,
          ParamType.String,
        ),
        'categoryName': serializeParam(
          _categoryName,
          ParamType.String,
        ),
      }.withoutNulls;

  static SelectedCatStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelectedCatStruct(
        categoryId: deserializeParam(
          data['categoryId'],
          ParamType.String,
          false,
        ),
        categoryName: deserializeParam(
          data['categoryName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SelectedCatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedCatStruct &&
        categoryId == other.categoryId &&
        categoryName == other.categoryName;
  }

  @override
  int get hashCode => const ListEquality().hash([categoryId, categoryName]);
}

SelectedCatStruct createSelectedCatStruct({
  String? categoryId,
  String? categoryName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedCatStruct(
      categoryId: categoryId,
      categoryName: categoryName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedCatStruct? updateSelectedCatStruct(
  SelectedCatStruct? selectedCat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedCat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedCatStructData(
  Map<String, dynamic> firestoreData,
  SelectedCatStruct? selectedCat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedCat == null) {
    return;
  }
  if (selectedCat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selectedCat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedCatData =
      getSelectedCatFirestoreData(selectedCat, forFieldValue);
  final nestedData =
      selectedCatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selectedCat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedCatFirestoreData(
  SelectedCatStruct? selectedCat, [
  bool forFieldValue = false,
]) {
  if (selectedCat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedCat.toMap());

  // Add any Firestore field values
  selectedCat.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedCatListFirestoreData(
  List<SelectedCatStruct>? selectedCats,
) =>
    selectedCats?.map((e) => getSelectedCatFirestoreData(e, true)).toList() ??
    [];
