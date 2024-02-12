import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'payment_option_widget.dart' show PaymentOptionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentOptionModel extends FlutterFlowModel<PaymentOptionWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - paymentAction] action in Container widget.
  String? gpayReturn;
  // Stores action output result for [Custom Action - paymentAction] action in Container widget.
  String? phonePeReturn;
  // Stores action output result for [Custom Action - paymentAction] action in Container widget.
  String? paytmReturn;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
