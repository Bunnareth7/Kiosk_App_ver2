import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/ordering_page/views/ordering_page_view.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static void open() => Get.offNamed(Routes.LOGIN);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AnimInkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        AppPath.arrow1,
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    20.verticalSpace, // Space for alignment
                  ],
                ),

                20.verticalSpace,

                // Profile Image
                SizedBox(
                  height: 100.w,
                  width: 100.w,
                  child: SvgPicture.asset(
                    AppPath.profileImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColor.neutral500,
                        child: Icon(Icons.error, size: 50.w),
                      );
                    },
                  ),
                ),

                10.verticalSpace,
                // Title
                Text('Cloud Account Login', style: AppTextStyle.body1_700),
                4.verticalSpace,
                // Subtitle
                Text(
                  'Log in to your Cloud Account',
                  style: AppTextStyle.body4_400.copyWith(
                    color: AppColor.neutral500,
                  ),
                ),

                30.verticalSpace,
                Container(
                  width: 343.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    color: AppColor.neutral200,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: AppTextStyle.body1_400.copyWith(
                              color: AppColor.neutral500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                12.verticalSpace,

                Container(
                  width: 343.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    color: AppColor.neutral200,

                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: AppTextStyle.body1_400.copyWith(
                              color: AppColor.neutral500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                          size: 20.w,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      8.horizontalSpace,
                    ],
                  ),
                ),

                30.verticalSpace,

                AnimInkWell(
                  onTap: () {
                    OrderingView.open();
                  },
                  child: Container(
                    width: 343.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColor.mainprimarykoi,
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
