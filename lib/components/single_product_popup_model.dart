import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/cart_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'single_product_popup_widget.dart' show SingleProductPopupWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class SingleProductPopupModel
    extends FlutterFlowModel<SingleProductPopupWidget> {
  ///  Local state fields for this component.

  double quantityCom = 0.0;

  double sellingPrice = 0.0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - returnIndexCartItemExistAction] action in Button widget.
  int? indexs;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
