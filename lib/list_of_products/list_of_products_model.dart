import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/customer_support_widget.dart';
import '/components/empty_products_widget.dart';
import '/components/floating_cart_widget.dart';
import '/components/quantity_adjust_widget.dart';
import '/components/single_add_button_widget.dart';
import '/components/single_product_popup_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'list_of_products_widget.dart' show ListOfProductsWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class ListOfProductsModel extends FlutterFlowModel<ListOfProductsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    unfocusNode.dispose();
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
          pageSize: 15,
          isStream: true,
        ),
      );
  }
}
