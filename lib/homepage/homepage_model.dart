import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/floating_cart_widget.dart';
import '/components/search_product_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'homepage_widget.dart' show HomepageWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class HomepageModel extends FlutterFlowModel<HomepageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for floatingCart component.
  late FloatingCartModel floatingCartModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    floatingCartModel = createModel(context, () => FloatingCartModel());
  }

  void dispose() {
    unfocusNode.dispose();
    floatingCartModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
