import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20.h,
          color: AppColor.neutral100,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: AnimInkWell(
                  onTap: () => Get.back(),
                  child: Icon(
                    Icons.chevron_left,
                    size: 26.sp,
                    color: AppColor.mainprimarykoi,
                  ),
                ),
              ),
              Text(
                'Setting',
                style: AppTextStyle.body2_600,
              ),
            ],
          ),
        ),
        10.verticalSpace,
        Container(
          height: 1.h,
          color: AppColor.neutral200,
        ),
      ],
    );
  }
}

class SettingGroup extends StatelessWidget {
  const SettingGroup({
    super.key,
    required this.tiles,
  });

  final List<SettingTile> tiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.neutral200,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          for (int i = 0; i < tiles.length; i++) ...[
            if (i != 0)
              Divider(
                height: 1,
                thickness: 1,
                indent: 16.w,
                endIndent: 16.w,
                color: AppColor.neutral200,
              ),
            tiles[i],
          ],
        ],
      ),
    );
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    this.iconAsset,
    required this.title,
    this.titleColor,
    this.trailingText,
    this.showChevron = true,
    required this.onTap,
  });

  final String? iconAsset;
  final String title;
  final Color? titleColor;
  final String? trailingText;
  final bool showChevron;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimInkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 14.h,
        ),
        child: Row(
          children: [
            if (iconAsset != null) ...[
              SvgPicture.asset(
                iconAsset!,
                width: 20.w,
                height: 20.w,
                colorFilter: const ColorFilter.mode(
                  AppColor.neutral500,
                  BlendMode.srcIn,
                ),
              ),
              12.horizontalSpace,
            ],
            Expanded(
              child: Text(
                title,
                style: AppTextStyle.body3_500.copyWith(
                  color: titleColor ?? AppColor.neutral800,
                ),
              ),
            ),
            if (trailingText != null) ...[
              Text(
                trailingText!,
                style: AppTextStyle.body3_400.copyWith(
                  color: AppColor.neutral400,
                ),
              ),
              4.horizontalSpace,
            ],
            if (showChevron)
              Icon(
                Icons.chevron_right,
                size: 18.sp,
                color: AppColor.neutral400,
              ),
          ],
        ),
      ),
    );
  }
}