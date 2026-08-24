import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/login/views/login_view.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});
  static void open() => Get.offNamed(Routes.LANGUAGE);

  final List<Map<String, String>> languages = const [
    {"label": "English", "code": "en"},
    {"label": "ខ្មែរ", "code": "km"},
    {"label": "中文", "code": "zh"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Column(
          children: [
            80.verticalSpace,
            // Globe icon
            SizedBox(
              height: 80.w,
              width: 80.w,
              child: SvgPicture.asset(
                AppPath.language,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Icon(Icons.error, size: 50.w),
                  );
                },
              ),
            ),
            30.verticalSpace,

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.neutral200,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: List.generate(languages.length, (index) {
                      final lang = languages[index];
                      final isLast = index == languages.length - 1;
                      return Column(
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: AnimInkWell(
                              onTap: () {
                                LoginView.open();
                              },
                              child: Container(
                                height: 50.h,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      lang['label']!,
                                      style: AppTextStyle.body3_500,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: Colors.grey,
                                      size: 20.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Thin divider between rows
                          if (!isLast)
                            Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.2),
                              indent: 16.w,
                              endIndent: 16.w,
                            ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
