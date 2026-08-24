import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class OptionChip extends StatelessWidget {
  const OptionChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
    this.priceLabel,
    this.imagePath,
  });

  final String label;
  final String? priceLabel;
  final String? imagePath;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimInkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: 78.w,
        height: 55.h,
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primarykoi200 : AppColor.neutral200,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (imagePath != null) ...[
              _OptionIcon(assetPath: imagePath!, isSelected: isSelected),
              2.verticalSpace,
            ],
            // Label
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.body4_400.copyWith(
                color: isSelected
                    ? AppColor.primarykoi400
                    : AppColor.neutral500,
              ),
            ),
            // Price
            if (priceLabel != null) ...[
              Text(
                priceLabel!,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 9.sp,
                  height: 1.0,
                  color: isSelected
                      ? AppColor.primarykoi400
                      : AppColor.neutral500,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _OptionIcon extends StatelessWidget {
  const _OptionIcon({required this.assetPath, required this.isSelected});

  final String assetPath;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isSvg = assetPath.toLowerCase().endsWith('.svg');

    if (isSvg) {
      return SvgPicture.asset(
        assetPath,
        width: 20.w,
        height: 20.w,
        fit: BoxFit.contain,
        colorFilter: isSelected
            ? const ColorFilter.mode(AppColor.primarykoi400, BlendMode.srcIn)
            : null,
        placeholderBuilder: (context) => Container(
          width: 20.w,
          height: 20.w,
          color: Colors.grey[200],
          child: Icon(
            Icons.image_not_supported,
            size: 14.w,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Image.asset(
      assetPath,
      width: 20.w,
      height: 20.w,
      fit: BoxFit.contain,
      color: isSelected ? AppColor.primarykoi400 : null,
      errorBuilder: (context, error, stackTrace) => Container(
        width: 20.w,
        height: 20.w,
        color: Colors.grey[200],
        child: Icon(Icons.image_not_supported, size: 14.w, color: Colors.grey),
      ),
    );
  }
}
