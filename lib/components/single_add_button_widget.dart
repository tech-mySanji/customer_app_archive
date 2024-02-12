import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'single_add_button_model.dart';
export 'single_add_button_model.dart';

class SingleAddButtonWidget extends StatefulWidget {
  const SingleAddButtonWidget({
    super.key,
    required this.product,
  });

  final ProductsRecord? product;

  @override
  State<SingleAddButtonWidget> createState() => _SingleAddButtonWidgetState();
}

class _SingleAddButtonWidgetState extends State<SingleAddButtonWidget> {
  late SingleAddButtonModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleAddButtonModel());

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
                .where((e) => e.productId == widget.product?.productId)
                .toList()
                .length ==
            0,
        true,
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await action_blocks.addingItemToCart(
            context,
            productItem: CartItemStruct(
              barcode: widget.product?.barcode,
              productName: widget.product?.productName,
              vendorId: widget.product?.vendorId,
              deliveryAgentId: widget.product?.deliveryAgentId,
              productId: widget.product?.productId,
              sellingPrice: widget.product?.sellingPrice,
              subCategoryId: widget.product?.subCategoryId,
              quantity: widget.product?.incrementalQuantity,
              unit: widget.product?.unit,
              productNameSecondary: widget.product?.productNameSecondary,
              incrementalQuantity: widget.product?.incrementalQuantity,
              minimumQuantity: widget.product?.minimumQuantity,
              addedTime: getCurrentTimestamp,
            ),
          );
        },
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(13.0),
              topLeft: Radius.circular(13.0),
              topRight: Radius.circular(0.0),
            ),
          ),
          child: Icon(
            Icons.add_circle_outline_outlined,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 20.0,
          ),
        ),
      ),
    );
  }
}
