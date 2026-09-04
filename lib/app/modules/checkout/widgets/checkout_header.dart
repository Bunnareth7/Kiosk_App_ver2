import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class CheckoutHeader extends StatefulWidget {
  const CheckoutHeader({super.key});

  @override
  State<CheckoutHeader> createState() => _CheckoutHeaderState();
}

class _CheckoutHeaderState extends State<CheckoutHeader> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  String _orderType = 'DINE IN';

  static const _options = ['Dine In', 'Take Away'];

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }

  void _toggleDropdown() {
    if (_overlayEntry != null) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            // Tap outside to dismiss
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _removeOverlay,
                child: Container(color: Colors.black.withValues(alpha: 0.25)),
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, 22.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    width: 160.w,
                    decoration: BoxDecoration(
                      color: AppColor.neutral100,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 12.r,
                          offset: Offset(0, 4.h),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < _options.length; i++) ...[
                          if (i != 0)
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: AppColor.neutral200,
                            ),
                          _OptionTile(
                            label: _options[i],
                            selected: _options[i].toUpperCase() == _orderType,
                            onTap: () {
                              setState(
                                () => _orderType = _options[i].toUpperCase(),
                              );
                              _removeOverlay();
                            },
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.neutral100,
      padding: EdgeInsets.only(right: 16.w, top: 10.h, left: 16.w),
      child: Column(
        children: [
          Text(
            'CHECKOUT',
            style: AppTextStyle.body2_600.copyWith(color: AppColor.neutral800),
          ),
          2.verticalSpace,
          CompositedTransformTarget(
            link: _layerLink,
            child: GestureDetector(
              onTap: _toggleDropdown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _orderType,
                    style: AppTextStyle.body3_500.copyWith(
                      color: AppColor.neutral500,
                    ),
                  ),
                  4.horizontalSpace,
                  Icon(
                    Icons.arrow_drop_down,
                    size: 16.sp,
                    color: AppColor.neutral500,
                  ),
                ],
              ),
            ),
          ),

          12.verticalSpace,

          _ProgressSteps(),
        ],
      ),
    );
  }
}

class _OptionTile extends StatelessWidget {
  const _OptionTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Text(
          label,
          style: AppTextStyle.body2_500.copyWith(color: AppColor.neutral800),
        ),
      ),
    );
  }
}

class _ProgressSteps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Stack(
        children: [
          Positioned(
            top: 1.h,
            left: 30.w,
            right: 5.w,
            child: Container(height: 3.h, color: AppColor.neutral200),
          ),
          Positioned(
            top: 1.h,
            left: 5.w,
            width: 150.w,
            child: Container(height: 3.h, color: AppColor.mainprimarykoi),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _step(
                'MENU',
                isActive: true,
                alignment: CrossAxisAlignment.start,
              ),
              _step(
                'CART',
                isActive: true,
                alignment: CrossAxisAlignment.center,
              ),
              _step(
                'CHECKOUT',
                isActive: false,
                alignment: CrossAxisAlignment.end,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _step(
    String title, {
    bool isActive = false,
    CrossAxisAlignment alignment = CrossAxisAlignment.center,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment,
      children: [
        Container(
          width: 7.w,
          height: 7.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? AppColor.mainprimarykoi : AppColor.neutral200,
          ),
        ),
        5.verticalSpace,
        Text(
          title,
          style: AppTextStyle.body3_500.copyWith(color: AppColor.neutral800),
        ),
      ],
    );
  }
}
