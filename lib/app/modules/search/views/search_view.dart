import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchItemController> {
  const SearchView({super.key});

  static void open() => Get.toNamed(Routes.SEARCH);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 8.h, left: 16.w, right: 16.w),
          child: Column(
            children: [
              // Search header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(
                      minWidth: 30.w,
                      minHeight: 30.h,
                    ),
                    icon: SvgPicture.asset(
                      AppPath.backbutton,
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: AppColor.neutral200,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: TextField(
                        controller: controller.searchController,
                        autofocus: true,
                        textInputAction: TextInputAction.search,
                        style: AppTextStyle.body1_400.copyWith(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search..',
                          hintStyle: AppTextStyle.body1_400.copyWith(
                            color: AppColor.neutral500,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: SvgPicture.asset(
                              AppPath.searchIcon,
                              width: 22.w,
                              height: 22.h,
                              colorFilter: ColorFilter.mode(
                                AppColor.neutral500,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          suffixIcon: Obx(() {
                            if (controller.searchText.value.isEmpty) {
                              return const SizedBox.shrink();
                            }
                            return IconButton(
                              onPressed: controller.clearSearch,
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.close,
                                size: 20.sp,
                                color: AppColor.neutral500,
                              ),
                            );
                          }),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 9.h,
                            horizontal: 8.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Search result
              Expanded(
                child: Obx(() {
                  if (controller.searchText.value.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Center(
                    child: Text(
                      'Search results will appear here',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColor.neutral500,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
