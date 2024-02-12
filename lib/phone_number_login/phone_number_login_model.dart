import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'phone_number_login_widget.dart' show PhoneNumberLoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneNumberLoginModel extends FlutterFlowModel<PhoneNumberLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for phoneNumberField widget.
  FocusNode? phoneNumberFieldFocusNode;
  TextEditingController? phoneNumberFieldController;
  String? Function(BuildContext, String?)? phoneNumberFieldControllerValidator;
  String? _phoneNumberFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Entered number is less than 10';
    }
    if (val.length > 10) {
      return 'Entered number is more than 10';
    }
    if (!RegExp('').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    phoneNumberFieldControllerValidator = _phoneNumberFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    phoneNumberFieldFocusNode?.dispose();
    phoneNumberFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
