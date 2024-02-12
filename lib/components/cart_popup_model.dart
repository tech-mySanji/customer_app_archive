import '/backend/schema/structs/index.dart';
import '/components/cart_bottom_button_widget.dart';
import '/components/empty_cart_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'cart_popup_widget.dart' show CartPopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPopupModel extends FlutterFlowModel<CartPopupWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for cartBottomButton component.
  late CartBottomButtonModel cartBottomButtonModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    cartBottomButtonModel = createModel(context, () => CartBottomButtonModel());
  }

  void dispose() {
    cartBottomButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
