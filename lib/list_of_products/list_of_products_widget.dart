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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'list_of_products_model.dart';
export 'list_of_products_model.dart';

class ListOfProductsWidget extends StatefulWidget {
  const ListOfProductsWidget({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.listAllSubCategory,
  });

  final String? categoryId;
  final String? categoryName;
  final List<CategoriesRecord>? listAllSubCategory;

  @override
  State<ListOfProductsWidget> createState() => _ListOfProductsWidgetState();
}

class _ListOfProductsWidgetState extends State<ListOfProductsWidget>
    with TickerProviderStateMixin {
  late ListOfProductsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'quantityAdjustOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 90.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'floatingCartOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 150.ms,
          begin: Offset(0.0, 58.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListOfProductsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, _) => [
            SliverAppBar(
              pinned: false,
              floating: false,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFAppState().selectedCategory.categoryName,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primary,
                      fontSize: 22.0,
                    ),
              ),
              actions: [
                FlutterFlowIconButton(
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.support_agent,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 40.0,
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return GestureDetector(
                          onTap: () => _model.unfocusNode.canRequestFocus
                              ? FocusScope.of(context)
                                  .requestFocus(_model.unfocusNode)
                              : FocusScope.of(context).unfocus(),
                          child: Padding(
                            padding: MediaQuery.viewInsetsOf(context),
                            child: Container(
                              height: 540.0,
                              child: CustomerSupportWidget(),
                            ),
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            )
          ],
          body: Builder(
            builder: (context) {
              return SafeArea(
                top: false,
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 70.0,
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final subCat = widget.listAllSubCategory!
                                  .map((e) => e)
                                  .toList();
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: List.generate(subCat.length,
                                      (subCatIndex) {
                                    final subCatItem = subCat[subCatIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 0.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState()
                                                .updateSelectedCategoryStruct(
                                              (e) => e
                                                ..categoryId =
                                                    subCatItem.categoryId
                                                ..categoryName =
                                                    subCatItem.categoryName,
                                            );
                                          });
                                        },
                                        text: subCatItem.categoryName,
                                        options: FFButtonOptions(
                                          height: 50.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: subCatItem.categoryId ==
                                                  FFAppState()
                                                      .selectedCategory
                                                      .categoryId
                                              ? FlutterFlowTheme.of(context)
                                                  .secondary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Poppins',
                                                    color: subCatItem
                                                                .categoryId ==
                                                            FFAppState()
                                                                .selectedCategory
                                                                .categoryId
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 70.0, 0.0, 0.0),
                          child: PagedListView<DocumentSnapshot<Object?>?,
                              ProductsRecord>(
                            pagingController: _model.setListViewController(
                                ProductsRecord.collection(
                                        FFAppState().branchIdRef)
                                    .where(
                                      'sub_category_id',
                                      isEqualTo: FFAppState()
                                                  .selectedCategory
                                                  .categoryId !=
                                              ''
                                          ? FFAppState()
                                              .selectedCategory
                                              .categoryId
                                          : null,
                                    )
                                    .where(
                                      'show_if',
                                      isEqualTo: true,
                                    )
                                    .orderBy('index', descending: true),
                                parent: FFAppState().branchIdRef),
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              80.0,
                            ),
                            reverse: false,
                            scrollDirection: Axis.vertical,
                            builderDelegate:
                                PagedChildBuilderDelegate<ProductsRecord>(
                              // Customize what your widget looks like when it's loading the first page.
                              firstPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitFadingFour(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              // Customize what your widget looks like when it's loading another page.
                              newPageProgressIndicatorBuilder: (_) => Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitFadingFour(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              noItemsFoundIndicatorBuilder: (_) => Center(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: double.infinity,
                                  child: EmptyProductsWidget(),
                                ),
                              ),
                              itemBuilder: (context, _, listViewIndex) {
                                final listViewProductsRecord = _model
                                    .listViewPagingController!
                                    .itemList![listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => _model
                                                    .unfocusNode.canRequestFocus
                                                ? FocusScope.of(context)
                                                    .requestFocus(
                                                        _model.unfocusNode)
                                                : FocusScope.of(context)
                                                    .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.95,
                                                child: SingleProductPopupWidget(
                                                  productDoc:
                                                      listViewProductsRecord,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 148.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 12.0,
                                                    color: Color(0xFFFFF7C4),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(13.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        130.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    10.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .stretch,
                                                            children: [
                                                              Text(
                                                                listViewProductsRecord
                                                                    .productName,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      fontSize:
                                                                          16.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                listViewProductsRecord
                                                                    .productNameSecondary,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Poppins',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          15.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 55.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    formatNumber(
                                                                      listViewProductsRecord
                                                                          .sellingPrice,
                                                                      formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                      decimalType:
                                                                          DecimalType
                                                                              .automatic,
                                                                      currency:
                                                                          '₹ ',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFFF28127),
                                                                          fontSize:
                                                                              16.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      '/ ${listViewProductsRecord.unit}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent1,
                                                                            fontSize:
                                                                                10.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .singleAddButtonModels
                                                                      .getModel(
                                                                    listViewProductsRecord
                                                                        .productId,
                                                                    listViewIndex,
                                                                  ),
                                                                  updateCallback:
                                                                      () => setState(
                                                                          () {}),
                                                                  updateOnChange:
                                                                      true,
                                                                  child:
                                                                      SingleAddButtonWidget(
                                                                    key: Key(
                                                                      'Key9fg_${listViewProductsRecord.productId}',
                                                                    ),
                                                                    product:
                                                                        listViewProductsRecord,
                                                                  ),
                                                                ),
                                                              ),
                                                              if (valueOrDefault<
                                                                  bool>(
                                                                FFAppState()
                                                                        .cart
                                                                        .where((e) =>
                                                                            e.productId ==
                                                                            listViewProductsRecord.productId)
                                                                        .toList()
                                                                        .length >
                                                                    0,
                                                                true,
                                                              ))
                                                                Flexible(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            1.0),
                                                                    child:
                                                                        wrapWithModel(
                                                                      model: _model
                                                                          .quantityAdjustModels
                                                                          .getModel(
                                                                        listViewProductsRecord
                                                                            .productId,
                                                                        listViewIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      updateOnChange:
                                                                          true,
                                                                      child:
                                                                          QuantityAdjustWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keybb7_${listViewProductsRecord.productId}',
                                                                        ),
                                                                        productDocument:
                                                                            listViewProductsRecord,
                                                                        index: functions.returnIndexCartItemExist(
                                                                            listViewProductsRecord.productId,
                                                                            FFAppState().cart.toList()),
                                                                      ),
                                                                    ).animateOnPageLoad(
                                                                            animationsMap['quantityAdjustOnPageLoadAnimation']!),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: listViewProductsRecord
                                                  .productImage,
                                              width: 124.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      if (FFAppState().cart.length > 0)
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 10.0),
                            child: wrapWithModel(
                              model: _model.floatingCartModel,
                              updateCallback: () => setState(() {}),
                              updateOnChange: true,
                              child: FloatingCartWidget(),
                            ).animateOnPageLoad(animationsMap[
                                'floatingCartOnPageLoadAnimation']!),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
