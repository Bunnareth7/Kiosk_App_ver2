import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
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
                        colorFilter: const ColorFilter.mode(
                          AppColor.mainprimarykoi,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Obx(
                      () => AnimInkWell(
                        onTap: controller.isLoading.value
                            ? null
                            : controller.login,
                        child: Text(
                          'Log In',
                          style: AppTextStyle.body3_500.copyWith(
                            color: AppColor.mainprimarykoi,
                          ),
                        ),
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

                // Error message
                Obx(() {
                  if (controller.errorMessage.value.isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Text(
                      controller.errorMessage.value,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.body4_400.copyWith(
                        color: AppColor.error500,
                      ),
                    ),
                  );
                }),

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
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: AppTextStyle.body2_400.copyWith(
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
                        child: Obx(
                          () => TextField(
                            controller: controller.passwordController,
                            obscureText: !controller.isPasswordVisible.value,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: AppTextStyle.body2_400.copyWith(
                                color: AppColor.neutral500,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Obx(
                        () => IconButton(
                          onPressed: controller.togglePasswordVisibility,
                          icon: SvgPicture.asset(
                            AppPath.closeEye,
                            width: 20.w,
                            height: 20.w,
                            colorFilter: controller.isPasswordVisible.value
                                ? ColorFilter.mode(
                                    AppColor.mainprimarykoi,
                                    BlendMode.srcIn,
                                  )
                                : null,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                      8.horizontalSpace,
                    ],
                  ),
                ),

                30.verticalSpace,

                Obx(
                  () => AnimInkWell(
                    onTap: controller.isLoading.value ? null : controller.login,
                    child: Container(
                      width: 343.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: controller.isLoading.value
                            ? AppColor.neutral200
                            : AppColor.mainprimarykoi,
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? SizedBox(
                                height: 20.w,
                                width: 20.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Login',
                                style: AppTextStyle.body3_600.copyWith(
                                  color: AppColor.neutral100,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),

                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}