import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'update_user_details_widget.dart' show UpdateUserDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UpdateUserDetailsModel extends FlutterFlowModel<UpdateUserDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode1;
  TextEditingController? nameFieldController1;
  String? Function(BuildContext, String?)? nameFieldController1Validator;
  String? _nameFieldController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode2;
  TextEditingController? nameFieldController2;
  String? Function(BuildContext, String?)? nameFieldController2Validator;
  String? _nameFieldController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for nameField widget.
  FocusNode? nameFieldFocusNode3;
  TextEditingController? nameFieldController3;
  String? Function(BuildContext, String?)? nameFieldController3Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    nameFieldController1Validator = _nameFieldController1Validator;
    nameFieldController2Validator = _nameFieldController2Validator;
  }

  void dispose() {
    nameFieldFocusNode1?.dispose();
    nameFieldController1?.dispose();

    nameFieldFocusNode2?.dispose();
    nameFieldController2?.dispose();

    nameFieldFocusNode3?.dispose();
    nameFieldController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
