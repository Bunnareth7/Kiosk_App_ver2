import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/data/database/app_database.dart';
import 'package:kiosk_app/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';
import 'package:kiosk_app/app/widgets/number_pad.dart';

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
                    },
                    onQuantityChanged: (int value) {
                      controller.updateQuantity(item.id, value);
                    },
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
  OverlayEntry? _overlayEntry;
  bool _isEditingQuantity = false;
  String _digits = '';

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _startEditingQuantity() {
    if (_isEditingQuantity) return;

    setState(() {
      _isEditingQuantity = true;
      _digits = '';
    });

    _showNumberPadOverlay();
  }

  void _showNumberPadOverlay() {
    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Tap outside the keypad saves the current value, like losing focus
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _saveQuantity,
                child: Container(color: Colors.transparent),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: NumberPad(
                onDigit: _onDigitTap,
                onBackspace: _onBackspace,
                onConfirm: _saveQuantity,
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _onDigitTap(String digit) {
    setState(() {
      if (_digits.isEmpty) {
        _digits = digit;
      } else if (_digits.length < 4) {
        _digits += digit;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_digits.length <= 1) {
        _digits = '';
      } else {
        _digits = _digits.substring(0, _digits.length - 1);
      }
    });
  }

  void _saveQuantity() {
    _removeOverlay();

    setState(() {
      _isEditingQuantity = false;
    });

    // Nothing typed — leave quantity unchanged.
    if (_digits.isEmpty) return;

    final value = int.tryParse(_digits);
    if (value == null) return;

    if (value == 0) {
      widget.onDelete();
      return;
    }

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
          color: AppColor.neutral100,
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Quantity — tap to edit inline, keypad slides up from bottom
            SizedBox(
              width: 28.w,
              child: AnimInkWell(
                onTap: _startEditingQuantity,
                child: _isEditingQuantity
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            color: AppColor.mainprimarykoi.withValues(
                              alpha: 0.12,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Text(
                              _digits.isEmpty ? '${widget.quantity}' : _digits,
                              style: AppTextStyle.body3_500,
                            ),
                          ),
                          Container(
                            width: 1.5.w,
                            height: 14.h,
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            color: AppColor.mainprimarykoi,
                          ),
                          Text('x', style: AppTextStyle.body3_500),
                        ],
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
              child: widget.image != null && widget.image!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(widget.image!, fit: BoxFit.contain),
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
