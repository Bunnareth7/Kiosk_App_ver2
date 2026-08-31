import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutSummary extends GetView<CheckoutController> {
  const CheckoutSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.neutral100,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              top: 16.h,
              bottom: 8.h,
              right: 16.w,
            ),
            child: Text(
              'Summary',
              style: AppTextStyle.body2_600.copyWith(
                color: AppColor.neutral800,
              ),
            ),
          ),

          StreamBuilder<List<CartItem>>(
            stream: controller.cartItems,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    'Something went wrong',
                    style: AppTextStyle.body3_400.copyWith(
                      color: AppColor.neutral500,
                    ),
                  ),
                );
              }
              final items = snapshot.data ?? [];

              if (items.isEmpty) {
                return Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Text(
                    'Your cart is empty',
                    style: AppTextStyle.body3_400.copyWith(
                      color: AppColor.neutral500,
                    ),
                  ),
                );
              }
              return Column(
                children: items.map((item) {
                  return CheckoutProductItem(
                    id: item.id,
                    name: item.productName,
                    quantity: item.quantity,
                    price: item.price,
                    image: item.image,
                    cupSize: item.cupSize,
                    sugarLevel: item.sugarLevel,
                    iceLevel: item.iceLevel,
                    toppings: item.toppings,
                    onDelete: () {
                      controller.deleteCartItem(item.id);
                    }, onQuantityChanged: (int value) { controller.updateQuantity(item.id, value); },
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
class CheckoutProductItem extends StatefulWidget {
  const CheckoutProductItem({
    super.key,
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.cupSize,
    required this.sugarLevel,
    required this.iceLevel,
    required this.toppings,
    required this.onDelete,
    required this.onQuantityChanged,
  });

  final int id;
  final String name;
  final int quantity;
  final double price;
  final String? image;

  final String cupSize;
  final String sugarLevel;
  final String iceLevel;
  final String toppings;
  final VoidCallback onDelete;
  final ValueChanged<int> onQuantityChanged;

  @override
  State<CheckoutProductItem> createState() => _CheckoutProductItemState();
}

class _CheckoutProductItemState extends State<CheckoutProductItem> {
  late final TextEditingController quantityController;
  late final FocusNode quantityFocusNode;

  bool isEditingQuantity = false;

  @override
  void initState() {
    super.initState();

    quantityController = TextEditingController(
      text: '${widget.quantity}',
    );

    quantityFocusNode = FocusNode();

    quantityFocusNode.addListener(() {
      if (!quantityFocusNode.hasFocus && isEditingQuantity) {
        _saveQuantity();
      }
    });
  }

  @override
  void didUpdateWidget(covariant CheckoutProductItem oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.quantity != widget.quantity && !isEditingQuantity) {
      quantityController.text = '${widget.quantity}';
    }
  }

  @override
  void dispose() {
    quantityController.dispose();
    quantityFocusNode.dispose();
    super.dispose();
  }

  void _startEditingQuantity() {
    setState(() {
      isEditingQuantity = true;
      quantityController.text = '${widget.quantity}';
      quantityController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: quantityController.text.length,
      );
    });

    quantityFocusNode.requestFocus();
  }

  void _saveQuantity() {
    final value = int.tryParse(quantityController.text);

    if (value == null || value <= 0) {
      quantityController.text = '${widget.quantity}';

      setState(() {
        isEditingQuantity = false;
      });

      return;
    }

    setState(() {
      isEditingQuantity = false;
    });

    if (value != widget.quantity) {
      widget.onQuantityChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.id),
      direction: DismissDirection.endToStart,

      background: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.only(right: 20.w),
        alignment: Alignment.centerRight,
        color: AppColor.error500,
        child: Icon(
          Icons.delete_outline,
          color : AppColor.neutral100,
          size: 24.sp,
        ),
      ),

      confirmDismiss: (direction) async {
        return true;
      },

      onDismissed: (direction) {
        widget.onDelete();
      },

      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 8.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Quantity
            SizedBox(
              width: 28.w,
              child: GestureDetector(
                onTap: _startEditingQuantity,
                child: isEditingQuantity
                    ? TextField(
                        controller: quantityController,
                        focusNode: quantityFocusNode,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.body3_500,
                        maxLength: 4,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: '',
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onSubmitted: (_) {
                          _saveQuantity();
                        },
                      )
                    : Text(
                        '${widget.quantity} x',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.body3_500,
                      ),
              ),
            ),

            8.horizontalSpace,
            // Product image
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                color: AppColor.neutral50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: widget.image != null &&
                      widget.image!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        widget.image!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Icon(
                      Icons.local_drink_outlined,
                      size: 26.sp,
                      color: AppColor.neutral400,
                    ),
            ),

            12.horizontalSpace,

            // Product information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.body3_500.copyWith(
                      color: AppColor.neutral800,
                    ),
                  ),

                  3.verticalSpace,

                  Text(
                    _buildDetails(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.body4_400.copyWith(
                      color: AppColor.neutral400,
                    ),
                  ),
                ],
              ),
            ),

            12.horizontalSpace,

            // Price
            Text(
              '\$${(widget.price * widget.quantity).toStringAsFixed(2)}',
              style: AppTextStyle.body3_500.copyWith(
                color: AppColor.neutral800,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _buildDetails() {
    final details = <String>[];

    if (widget.cupSize.isNotEmpty) {
      details.add(widget.cupSize);
    }

    if (widget.sugarLevel.isNotEmpty) {
      details.add(widget.sugarLevel);
    }

    if (widget.iceLevel.isNotEmpty) {
      details.add(widget.iceLevel);
    }

    if (widget.toppings.isNotEmpty) {
      details.add(widget.toppings);
    }

    return details.join(' - ');
  }
}
