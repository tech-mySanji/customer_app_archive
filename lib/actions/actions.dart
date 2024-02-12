import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';

Future addingItemToCart(
  BuildContext context, {
  required CartItemStruct? productItem,
}) async {
  if (functions.alreadyAddedToCart(productItem!, FFAppState().cart.toList())) {
    FFAppState().update(() {
      FFAppState().addToCart(productItem!);
    });
  } else {
    FFAppState().update(() {
      FFAppState().addToCart(productItem!);
    });
  }
}

Future deleteCartItem(
  BuildContext context, {
  CartItemStruct? inputItem,
}) async {
  FFAppState().update(() {
    FFAppState().removeAtIndexFromCart(functions.returnIndexCartItemExist(
        inputItem!.productId, FFAppState().cart.toList()));
  });
}

Future reduceQuantity(
  BuildContext context, {
  CartItemStruct? inputItem,
}) async {}
