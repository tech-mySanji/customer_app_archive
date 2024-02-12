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

import 'package:upi_india/upi_india.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!

Future<UpiResponse>? _transaction;
UpiIndia _upiIndia = UpiIndia();
List<UpiApp>? apps;

Future<String?> paymentAction(
  double amount,
  String customerId,
  String orderId,
  String paymentId,
  String upiApps,
) async {
  var appToChoose;
  if (upiApps == "googlePay") {
    appToChoose = UpiApp.googlePay;
  } else if (upiApps == "phonePe") {
    appToChoose = UpiApp.phonePe;
  } else if (upiApps == "paytm") {
    appToChoose = UpiApp.paytm;
  } else {
    appToChoose = UpiApp.googlePay;
  }

  return _upiIndia
      .startTransaction(
    app: appToChoose,
    receiverUpiId: "88082350@idfcbank",
    receiverName: 'Mysanji Technologies PVT LTD',
    transactionRefId: customerId,
    transactionNote: orderId + "  -  " + paymentId,
    amount: amount.roundToDouble(),
  )
      .then((value) {
    return value.status?.toUpperCase();
  }).onError(
    (error, stackTrace) {
      switch (error) {
        case UpiIndiaAppNotInstalledException:
          return 'Requested app not installed on device';
        case UpiIndiaUserCancelledException:
          return 'You cancelled the transaction';
        case UpiIndiaNullResponseException:
          return 'Requested app didn\'t return any response';
        case UpiIndiaInvalidParametersException:
          return 'Requested app cannot handle the transaction';
        default:
          return 'An Unknown error has occurred';
      }
    },
  );

  // Add your function code here!
}
