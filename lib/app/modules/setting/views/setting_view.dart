import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/defualt_lang_setting/views/defualt_lang_setting_view.dart';
import 'package:kiosk_app/app/modules/general_setting/views/general_setting_view.dart';
import 'package:kiosk_app/app/modules/list_of_product/views/list_of_product_view.dart';
import 'package:kiosk_app/app/modules/login/controllers/login_controller.dart';
import 'package:kiosk_app/app/modules/setting/widgets/setting_widgets.dart';
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
            const SettingHeader(),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                children: [
                  SettingGroup(
                    tiles: [
                      SettingTile(
                        iconAsset: AppPath.generalSetting,
                        title: 'General Setting',
                        onTap: () {
                          GeneralSettingView.open();
                        },
                      ),
                      SettingTile(
                        iconAsset: AppPath.listOfProduct,
                        title: 'List of Products View',
                        trailingText: 'x3',
                        onTap: () {
                          ListOfProductsView.open();
                        },
                      ),
                      SettingTile(
                        iconAsset: AppPath.languageSetting,
                        title: 'Default Language',
                        trailingText: 'English',
                        onTap: () {
                          DefaultLanguageView.open();
                        },
                      ),
                    ],
                  ),

                  16.verticalSpace,

                  SettingGroup(
                    tiles: [
                      SettingTile(
                        iconAsset: AppPath.timeOut,
                        title: 'Idle Timeout & Auto-Refresh',
                        onTap: () {},
                      ),
                      SettingTile(
                        iconAsset: AppPath.paper,
                        title: 'Auto-Paper Detection for Printer',
                        onTap: () {},
                      ),
                      SettingTile(
                        iconAsset: AppPath.lamp,
                        title: 'Lamp Status Config',
                        onTap: () {},
                      ),
                      SettingTile(
                        iconAsset: AppPath.timeOut,
                        title: 'Customer Support',
                        onTap: () {},
                      ),
                    ],
                  ),

                  16.verticalSpace,

                  SettingGroup(
                    tiles: [
                      SettingTile(
                        title: 'Report',
                        titleColor: AppColor.mainprimarykoi,
                        showChevron: false,
                        onTap: () {},
                      ),
                      SettingTile(
                        title: 'Activity Log',
                        titleColor: AppColor.mainprimarykoi,
                        showChevron: false,
                        onTap: () {},
                      ),
                    ],
                  ),

                  20.verticalSpace,

                  Center(
                    child: AnimInkWell(
                      onTap: () {
                        final storage = GetStorage();

                        storage.remove('access_token');
                        storage.remove('refresh_token');

                        if (Get.isRegistered<LoginController>()) {
                          Get.delete<LoginController>();
                        }

                        Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppPath.logout,
                            width: 18.w,
                            height: 18.w,
                            colorFilter: const ColorFilter.mode(
                              AppColor.error500,
                              BlendMode.srcIn,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            'Log Out',
                            style: AppTextStyle.body3_500.copyWith(
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
