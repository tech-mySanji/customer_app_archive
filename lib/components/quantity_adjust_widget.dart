import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quantity_adjust_model.dart';
export 'quantity_adjust_model.dart';

class QuantityAdjustWidget extends StatefulWidget {
  const QuantityAdjustWidget({
    super.key,
    required this.productDocument,
    required this.index,
  });

  final ProductsRecord? productDocument;
  final int? index;

  @override
  State<QuantityAdjustWidget> createState() => _QuantityAdjustWidgetState();
}

class _QuantityAdjustWidgetState extends State<QuantityAdjustWidget> {
  late QuantityAdjustModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuantityAdjustModel());

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

    return Visibility(
      visible: valueOrDefault<bool>(
        FFAppState()
                .cart
                .where((e) => e.productId == widget.productDocument?.productId)
                .toList()
                .length >
            0,
        true,
      ),
      child: Container(
        height: 48.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(13.0),
            topLeft: Radius.circular(13.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).secondary,
              icon: Icon(
                Icons.do_disturb_on_outlined,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                if (functions.decreaseableOrNot(
                    FFAppState().cart[widget.index!].quantity,
                    widget.productDocument!.minimumQuantity,
                    widget.productDocument!.incrementalQuantity)) {
                  setState(() {
                    FFAppState().updateCartAtIndex(
                      widget.index!,
                      (e) => e
                        ..incrementQuantity(
                            -widget.productDocument!.incrementalQuantity),
                    );
                  });
                } else {
                  setState(() {
                    FFAppState().removeAtIndexFromCart(widget.index!);
                  });
                }
              },
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
              child: Text(
                FFAppState().cart[widget.index!].quantity.toString(),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
            FlutterFlowIconButton(
              borderRadius: 20.0,
              borderWidth: 1.0,
              buttonSize: 40.0,
              fillColor: FlutterFlowTheme.of(context).secondary,
              icon: Icon(
                Icons.add_circle_outline,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                setState(() {
                  FFAppState().updateCartAtIndex(
                    functions.returnIndexCartItemExist(
                        widget.productDocument!.productId,
                        FFAppState().cart.toList()),
                    (e) => e
                      ..incrementQuantity(
                          widget.productDocument!.incrementalQuantity),
                  );
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
