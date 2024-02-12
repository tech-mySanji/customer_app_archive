import '/backend/backend.dart';
import '/components/empty_search_widget.dart';
import '/components/floating_cart_widget.dart';
import '/components/quantity_adjust_widget.dart';
import '/components/single_add_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'search_product_widget.dart' show SearchProductWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class SearchProductModel extends FlutterFlowModel<SearchProductWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for ListView widget.

  PagingController<DocumentSnapshot?, ProductsRecord>? listViewPagingController;
  Query? listViewPagingQuery;
  List<StreamSubscription?> listViewStreamSubscriptions = [];

  // Models for singleAddButton dynamic component.
  late FlutterFlowDynamicModels<SingleAddButtonModel> singleAddButtonModels;
  // Models for quantityAdjust dynamic component.
  late FlutterFlowDynamicModels<QuantityAdjustModel> quantityAdjustModels;
  // Model for floatingCart component.
  late FloatingCartModel floatingCartModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    singleAddButtonModels =
        FlutterFlowDynamicModels(() => SingleAddButtonModel());
    quantityAdjustModels =
        FlutterFlowDynamicModels(() => QuantityAdjustModel());
    floatingCartModel = createModel(context, () => FloatingCartModel());
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listViewStreamSubscriptions.forEach((s) => s?.cancel());
    listViewPagingController?.dispose();

    singleAddButtonModels.dispose();
    quantityAdjustModels.dispose();
    floatingCartModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  PagingController<DocumentSnapshot?, ProductsRecord> setListViewController(
    Query query, {
    DocumentReference<Object?>? parent,
  }) {
    listViewPagingController ??= _createListViewController(query, parent);
    if (listViewPagingQuery != query) {
      listViewPagingQuery = query;
      listViewPagingController?.refresh();
    }
    return listViewPagingController!;
  }

  PagingController<DocumentSnapshot?, ProductsRecord> _createListViewController(
    Query query,
    DocumentReference<Object?>? parent,
  ) {
    final controller =
        PagingController<DocumentSnapshot?, ProductsRecord>(firstPageKey: null);
    return controller
      ..addPageRequestListener(
        (nextPageMarker) => queryProductsRecordPage(
          parent: parent,
          queryBuilder: (_) => listViewPagingQuery ??= query,
          nextPageMarker: nextPageMarker,
          streamSubscriptions: listViewStreamSubscriptions,
          controller: controller,
          pageSize: 25,
          isStream: true,
        ),
      );
  }
}
