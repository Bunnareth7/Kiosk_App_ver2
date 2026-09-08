import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});
  static void open() => Get.toNamed(Routes.SETTING);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Column(
          children: [
            _SettingHeader(),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                children: [
                  _SettingGroup(
                    tiles: [
                      _SettingTile(
                        iconAsset: AppPath.generalSetting,
                        title: 'General Setting',
                        onTap: () {},
                      ),
                      _SettingTile(
                        iconAsset: AppPath.listOfProduct,
                        title: 'List of Products View',
                        trailingText: 'x3',
                        onTap: () {},
                      ),
                      _SettingTile(
                        iconAsset: AppPath.languageSetting,
                        title: 'Default Language',
                        trailingText: 'English',
                        onTap: () {},
                      ),
                    ],
                  ),

                  16.verticalSpace,

                  _SettingGroup(
                    tiles: [
                      _SettingTile(
                        iconAsset: AppPath.timeOut,
                        title: 'Idle Timeout & Auto-Refresh',
                        onTap: () {},
                      ),
                      _SettingTile(
                        iconAsset: AppPath.paper,
                        title: 'Auto-Paper Detection for Printer',
                        onTap: () {},
                      ),
                      _SettingTile(
                        iconAsset: AppPath.lamp,
                        title: 'Lamp Status Config',
                        onTap: () {},
                      ),
                      _SettingTile(
                        iconAsset: AppPath.timeOut,
                        title: 'Customer Support',
                        onTap: () {},
                      ),
                    ],
                  ),

                  16.verticalSpace,

                  _SettingGroup(
                    tiles: [
                      _SettingTile(
                        title: 'Report',
                        titleColor: AppColor.mainprimarykoi,
                        showChevron: false,
                        onTap: () {},
                      ),
                      _SettingTile(
                        title: 'Activity Log',
                        titleColor: AppColor.mainprimarykoi,
                        showChevron: false,
                        onTap: () {},
                      ),
                    ],
                  ),

                  24.verticalSpace,

                  Center(
                    child: AnimInkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppPath.logout,
                            width: 18.w,
                            height: 18.w,
                            colorFilter: ColorFilter.mode(
                              AppColor.error500,
                              BlendMode.srcIn,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            'Log Out',
                            style: AppTextStyle.body3_600.copyWith(
                              color: AppColor.error500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
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
            style: AppTextStyle.body2_700.copyWith(color: AppColor.neutral800),
          ),
        ],
      ),
    );
  }
}

class _SettingGroup extends StatelessWidget {
  const _SettingGroup({required this.tiles});

  final List<_SettingTile> tiles;

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

class _SettingTile extends StatelessWidget {
  const _SettingTile({
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
                color: AppColor.neutral400,
              ),
          ],
        ),
      ),
    );
  }
}
