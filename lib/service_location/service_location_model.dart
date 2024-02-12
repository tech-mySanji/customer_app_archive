import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/delivery_not_available_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'service_location_widget.dart' show ServiceLocationWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiceLocationModel extends FlutterFlowModel<ServiceLocationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for fullName widget.
  FocusNode? fullNameFocusNode;
  TextEditingController? fullNameController;
  String? Function(BuildContext, String?)? fullNameControllerValidator;
  String? _fullNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for address widget.
  FocusNode? addressFocusNode;
  TextEditingController? addressController;
  String? Function(BuildContext, String?)? addressControllerValidator;
  String? _addressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for pincode widget.
  FocusNode? pincodeFocusNode;
  TextEditingController? pincodeController;
  String? Function(BuildContext, String?)? pincodeControllerValidator;
  String? _pincodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Minimum 6 Digit is Required';
    }
    if (val.length > 6) {
      return 'Maximum Number Allowed is 6';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (checkPincode)] action in submitButton widget.
  ApiCallResponse? apiRes;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fullNameControllerValidator = _fullNameControllerValidator;
    addressControllerValidator = _addressControllerValidator;
    pincodeControllerValidator = _pincodeControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    fullNameFocusNode?.dispose();
    fullNameController?.dispose();

    addressFocusNode?.dispose();
    addressController?.dispose();

    pincodeFocusNode?.dispose();
    pincodeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
