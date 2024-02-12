import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _branchIdRef = prefs.getString('ff_branchIdRef')?.ref ?? _branchIdRef;
    });
    _safeInit(() {
      _localCartVariable =
          prefs.getStringList('ff_localCartVariable') ?? _localCartVariable;
    });
    _safeInit(() {
      _branchArea = prefs.getString('ff_branchArea') ?? _branchArea;
    });
    _safeInit(() {
      _branchCode = prefs.getString('ff_branchCode') ?? _branchCode;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_selectedCategory')) {
        try {
          final serializedData = prefs.getString('ff_selectedCategory') ?? '{}';
          _selectedCategory =
              SelectedCatStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _cart = prefs
              .getStringList('ff_cart')
              ?.map((x) {
                try {
                  return CartItemStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _cart;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _branchIdRef;
  DocumentReference? get branchIdRef => _branchIdRef;
  set branchIdRef(DocumentReference? _value) {
    _branchIdRef = _value;
    _value != null
        ? prefs.setString('ff_branchIdRef', _value.path)
        : prefs.remove('ff_branchIdRef');
  }

  List<String> _localCartVariable = [];
  List<String> get localCartVariable => _localCartVariable;
  set localCartVariable(List<String> _value) {
    _localCartVariable = _value;
    prefs.setStringList('ff_localCartVariable', _value);
  }

  void addToLocalCartVariable(String _value) {
    _localCartVariable.add(_value);
    prefs.setStringList('ff_localCartVariable', _localCartVariable);
  }

  void removeFromLocalCartVariable(String _value) {
    _localCartVariable.remove(_value);
    prefs.setStringList('ff_localCartVariable', _localCartVariable);
  }

  void removeAtIndexFromLocalCartVariable(int _index) {
    _localCartVariable.removeAt(_index);
    prefs.setStringList('ff_localCartVariable', _localCartVariable);
  }

  void updateLocalCartVariableAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _localCartVariable[_index] = updateFn(_localCartVariable[_index]);
    prefs.setStringList('ff_localCartVariable', _localCartVariable);
  }

  void insertAtIndexInLocalCartVariable(int _index, String _value) {
    _localCartVariable.insert(_index, _value);
    prefs.setStringList('ff_localCartVariable', _localCartVariable);
  }

  String _branchArea = '';
  String get branchArea => _branchArea;
  set branchArea(String _value) {
    _branchArea = _value;
    prefs.setString('ff_branchArea', _value);
  }

  String _branchCode = '';
  String get branchCode => _branchCode;
  set branchCode(String _value) {
    _branchCode = _value;
    prefs.setString('ff_branchCode', _value);
  }

  SelectedCatStruct _selectedCategory = SelectedCatStruct();
  SelectedCatStruct get selectedCategory => _selectedCategory;
  set selectedCategory(SelectedCatStruct _value) {
    _selectedCategory = _value;
    prefs.setString('ff_selectedCategory', _value.serialize());
  }

  void updateSelectedCategoryStruct(Function(SelectedCatStruct) updateFn) {
    updateFn(_selectedCategory);
    prefs.setString('ff_selectedCategory', _selectedCategory.serialize());
  }

  List<CartItemStruct> _cart = [];
  List<CartItemStruct> get cart => _cart;
  set cart(List<CartItemStruct> _value) {
    _cart = _value;
    prefs.setStringList('ff_cart', _value.map((x) => x.serialize()).toList());
  }

  void addToCart(CartItemStruct _value) {
    _cart.add(_value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeFromCart(CartItemStruct _value) {
    _cart.remove(_value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void updateCartAtIndex(
    int _index,
    CartItemStruct Function(CartItemStruct) updateFn,
  ) {
    _cart[_index] = updateFn(_cart[_index]);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCart(int _index, CartItemStruct _value) {
    _cart.insert(_index, _value);
    prefs.setStringList('ff_cart', _cart.map((x) => x.serialize()).toList());
  }

  final _categoryListManager = StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> categoryList({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _categoryListManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryListCache() => _categoryListManager.clear();
  void clearCategoryListCacheKey(String? uniqueKey) =>
      _categoryListManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
