import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference branchRefGenerator(String branchCode) {
  return FirebaseFirestore.instance.collection("root").doc(branchCode);
}

List<String>? keyboardFunction(
  String field1,
  String field2,
) {
  var string1 = field1.toLowerCase();
  var string2 = field2.toLowerCase();
  var inputString = string1 + " " + string2;
  final list = inputString.split(" ");
  var keywords = [
    " ",
    string1,
    string2,
  ];

  var listIterator = list.iterator;

  while (listIterator.moveNext()) {
    var appendString = "";

    listIterator.current.runes.forEach((int rune) {
      appendString += String.fromCharCode(rune);
      keywords.add(appendString);
    });

    inputString = inputString.replaceAll(listIterator.current.toString(), " ");
  }

  return keywords;
}

bool alreadyAddedToCart(
  CartItemStruct singleCartItem,
  List<CartItemStruct> listCartItem,
) {
  // get a list of item and a another item return true if the product_id of any item matches in the list
  return listCartItem
      .any((element) => element.productId == singleCartItem.productId);
}

int returnIndexCartItemExist(
  String productId,
  List<CartItemStruct> listOfCartItem,
) {
  // return index of cart item of product matches with the arguments provided
  int index = -1;
  for (int i = 0; i < listOfCartItem.length; i++) {
    if (listOfCartItem[i].productId == productId) {
      index = i;
      break;
    }
  }
  return index;
}

double newCustomFunction(List<CartItemStruct> listCartItem) {
  // get list of cart item and return total by multipling the quantity and selling price of each
  double total = 0;
  for (var i = 0; i < listCartItem.length; i++) {
    total += listCartItem[i].quantity * listCartItem[i].sellingPrice;
  }
  return total;
}

bool decreaseableOrNot(
  double currentQuan,
  double minimumQuan,
  double incrementalQuan,
) {
  if ((currentQuan - incrementalQuan) > minimumQuan) {
    return true;
  } else {
    return false;
  }
}

double totalCalculation(List<CartItemStruct> cartItem) {
  // return grand total
  double grandTotal = 0.0;

  for (CartItemStruct item in cartItem) {
    grandTotal += item.sellingPrice * item.quantity;
  }

  return grandTotal;
}
