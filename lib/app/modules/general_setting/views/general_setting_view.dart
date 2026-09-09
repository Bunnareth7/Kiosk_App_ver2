import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/widgets/setting_widget.dart';

class GeneralSettingView extends StatefulWidget {
  const GeneralSettingView({super.key});

  static void open() => Get.toNamed(Routes.GENERAL_SETTING);
  @override
  State<GeneralSettingView> createState() => _GeneralSettingViewState();
}

class _GeneralSettingViewState extends State<GeneralSettingView> {

  // shared preferences) instead of local widget state.
  bool _packagingEnabled = false;
  bool _tipsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Column(
          children: [
            const SettingHeader(title: 'General Setting'),
            Divider(height: 1, thickness: 1, color: AppColor.neutral200),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  SettingToggleRow(
                    title: 'Packaging',
                    value: _packagingEnabled,
                    onChanged: (value) {
                      setState(() => _packagingEnabled = value);
                    },
                  ),
                  SettingToggleRow(
                    title: 'Tips',
                    value: _tipsEnabled,
                    onChanged: (value) {
                      setState(() => _tipsEnabled = value);
                    },
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
