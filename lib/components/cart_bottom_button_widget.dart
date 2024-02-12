import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_bottom_button_model.dart';
export 'cart_bottom_button_model.dart';

class CartBottomButtonWidget extends StatefulWidget {
  const CartBottomButtonWidget({super.key});

  @override
  State<CartBottomButtonWidget> createState() => _CartBottomButtonWidgetState();
}

class _CartBottomButtonWidgetState extends State<CartBottomButtonWidget>
    with TickerProviderStateMixin {
  late CartBottomButtonModel _model;

  final animationsMap = {
    'buttonOnPageLoadAnimation': AnimationInfo(
      loop: true,
      reverse: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: Offset(0.98, 0.98),
          end: Offset(1.0, 1.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CartBottomButtonModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      constraints: BoxConstraints(
        maxHeight: 170.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Color(0xFFFFF7C4),
          width: 3.0,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Charges',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  '₹ 0.00',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Grand Total',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  formatNumber(
                    functions.totalCalculation(FFAppState().cart.toList()),
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.automatic,
                    currency: '₹ ',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFFF9BB48),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          FFButtonWidget(
            onPressed: () async {
              if (FFAppState().cart.length != 0) {
                var ordersRecordReference =
                    OrdersRecord.createDoc(FFAppState().branchIdRef!);
                await ordersRecordReference.set({
                  ...createOrdersRecordData(
                    address: valueOrDefault(currentUserDocument?.address, ''),
                    orderStatus: 'pending',
                    customerName: valueOrDefault(currentUserDocument?.name, ''),
                    phoneNumber: currentPhoneNumber,
                    invoiceNumber: '0',
                    paymentStatus: 'unpaid',
                    userId: currentUserUid,
                    branchId: FFAppState().branchIdRef?.id,
                    noOfPackage: 0,
                    noOfDonePackage: FFAppState().cart.length,
                    orderedTime: getCurrentTimestamp,
                    location: currentUserDocument?.location,
                    total:
                        functions.totalCalculation(FFAppState().cart.toList()),
                  ),
                  ...mapToFirestore(
                    {
                      'packages': getCartItemListFirestoreData(
                        FFAppState().cart,
                      ),
                    },
                  ),
                });
                _model.orderData = OrdersRecord.getDocumentFromData({
                  ...createOrdersRecordData(
                    address: valueOrDefault(currentUserDocument?.address, ''),
                    orderStatus: 'pending',
                    customerName: valueOrDefault(currentUserDocument?.name, ''),
                    phoneNumber: currentPhoneNumber,
                    invoiceNumber: '0',
                    paymentStatus: 'unpaid',
                    userId: currentUserUid,
                    branchId: FFAppState().branchIdRef?.id,
                    noOfPackage: 0,
                    noOfDonePackage: FFAppState().cart.length,
                    orderedTime: getCurrentTimestamp,
                    location: currentUserDocument?.location,
                    total:
                        functions.totalCalculation(FFAppState().cart.toList()),
                  ),
                  ...mapToFirestore(
                    {
                      'packages': getCartItemListFirestoreData(
                        FFAppState().cart,
                      ),
                    },
                  ),
                }, ordersRecordReference);

                await _model.orderData!.reference.update(createOrdersRecordData(
                  orderId: _model.orderData?.reference.id,
                ));
                setState(() {
                  FFAppState().cart = [];
                });

                context.goNamed('successPage');
              }

              setState(() {});
            },
            text: 'Place Order',
            icon: Icon(
              Icons.shopping_cart_checkout,
              size: 28.0,
            ),
            options: FFButtonOptions(
              width: double.infinity,
              height: 60.0,
              padding: EdgeInsets.all(0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).secondary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
              elevation: 0.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 0.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation']!),
        ],
      ),
    );
  }
}
