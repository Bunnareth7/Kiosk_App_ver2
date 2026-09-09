import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';


class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
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
            title,
            style: AppTextStyle.body2_700.copyWith(color: AppColor.neutral800),
          ),
        ],
      ),
    );
  }
}


class SettingGroup extends StatelessWidget {
  const SettingGroup({super.key, required this.tiles});

  final List<Widget> tiles;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.neutral50,
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            if (iconAsset != null) ...[
              SvgPicture.asset(
                iconAsset!,
                width: 20.w,
                height: 20.w,
                colorFilter: ColorFilter.mode(
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
                color: AppColor.neutral200,
              ),
          ],
        ),
      ),
    );
  }
}


class SettingSelectableRow extends StatelessWidget {
  const SettingSelectableRow({
    super.key,
    required this.title,
    this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String? subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimInkWell(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyle.body3_500.copyWith(
                          color: AppColor.neutral800,
                        ),
                      ),
                      if (subtitle != null) ...[
                        2.verticalSpace,
                        Text(
                          subtitle!,
                          style: AppTextStyle.body4_400.copyWith(
                            color: AppColor.neutral400,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (selected)
                  Icon(
                    Icons.check,
                    size: 18.sp,
                    color: AppColor.mainprimarykoi,
                  ),
              ],
            ),
          ),
          Divider(height: 1, thickness: 1, color: AppColor.neutral200),
        ],
      ),
    );
  }
}

class SettingToggleRow extends StatelessWidget {
  const SettingToggleRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: AppTextStyle.body3_500.copyWith(
                    color: AppColor.neutral800,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onChanged(!value),
                // actual toggle SVG assets.
                child: SvgPicture.asset(
                  value ? AppPath.switchIcon : AppPath.switchIcon,
                  width: 36.w,
                  height: 20.w,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, thickness: 1, color: AppColor.neutral200),
      ],
    );
  }
}