// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<int> returnIndexCartItemExistAction(
  String? productId,
  List<CartItemStruct> listOfCartItem,
) async {
  int index = -1;
  for (int i = 0; i < listOfCartItem.length; i++) {
    if (listOfCartItem[i].productId == productId) {
      index = i;
      break;
    }
  }
  return index;
  // Add your function code here!
}
