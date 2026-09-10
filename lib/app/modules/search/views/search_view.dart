import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/data/Model/products_model.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/modules/order_detail/views/order_detail_view.dart';

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
                      colorFilter: ColorFilter.mode(
                        AppColor.neutral800,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: AppColor.neutral200,
                        borderRadius: BorderRadius.circular(10.r),
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
                              width: 16.5.w,
                              height: 16.5.h,
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

              24.verticalSpace,

              Expanded(
                child: Obx(() {
                  if (controller.searchResults.isEmpty) {
                    return Center(
                      child: Text(
                        'No products found',
                        style: AppTextStyle.body3_400.copyWith(
                          color: AppColor.neutral500,
                        ),
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.only(bottom: 20.h),
                    itemCount: controller.searchResults.length,
                    separatorBuilder: (_, _) => SizedBox(height: 8.h),
                    itemBuilder: (context, index) {
                      final product = controller.searchResults[index];
 
                      return _SearchProductItem(product: product);
                    },
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

class _SearchProductItem extends StatelessWidget {
  const _SearchProductItem({required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () => OrderDetailView.open(product),
      child: Container(
        height: 76.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: AppColor.neutral100,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColor.neutral200, width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.body2_500,
                  ),
                  8.verticalSpace,
                  Text(
                    '\$${product.price.toStringAsFixed(2)}',
                    style: AppTextStyle.body3_500.copyWith(
                      color: AppColor.error500,
                    ),
                  ),
                ],
              ),
            ),

            8.verticalSpace,
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: AppColor.neutral200,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Image.asset(
                  product.imagePath,
                  width: 40.w,
                  height: 40.w,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image,
                      color: AppColor.neutral500,
                      size: 28.w,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
