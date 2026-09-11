import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class PackagingOptionWidget extends StatelessWidget {
  const PackagingOptionWidget({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.neutral100,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Packaging Option',
            style: AppTextStyle.body2_600.copyWith(color: AppColor.neutral800),
          ),

          12.verticalSpace,

          Row(
            children: [
              Expanded(
                child: _PackagingOptionItem(
                  title: 'No Bag - Eco Friendly',
                  isSelected: selectedIndex == 0,
                  onTap: () => onSelected(0),
                ),
              ),

              8.horizontalSpace,

              Expanded(
                child: _PackagingOptionItem(
                  title: 'Plastic Bag',
                  isSelected: selectedIndex == 1,
                  onTap: () => onSelected(1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PackagingOptionItem extends StatelessWidget {
  const _PackagingOptionItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimInkWell(
      onTap: onTap,
      child: Container(
        height: 32.h,
        width : 163.5.w,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primarykoi200 : AppColor.neutral200,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTextStyle.body4_500.copyWith(
                color: isSelected
                    ? AppColor.mainprimarykoi
                    : AppColor.neutral500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
