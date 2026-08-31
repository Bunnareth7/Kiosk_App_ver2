import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

import '../controllers/remark_controller.dart';

class RemarkView extends GetView<RemarkController> {
  const RemarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      appBar: AppBar(
        backgroundColor: AppColor.neutral100,
        leading: IconButton(
          onPressed: Get.back,
          icon: SvgPicture.asset(AppPath.backbutton, width: 18.w, height: 18.h),
        ),
        title: Text('Remark', style: AppTextStyle.body1_600),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: controller.clearRemarks,
            child: Text(
              'Clear',
              style: AppTextStyle.body3_500.copyWith(
                color: AppColor.primarykoi400,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: SizedBox(
                width: double.infinity,
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 10.h,
                        children: [
                          ...controller.remarks.map(
                            (remark) => _RemarkChip(
                              text: remark,
                              selected: controller.selectedRemarks.contains(
                                remark,
                              ),
                              onTap: () => controller.toggleRemark(remark),
                            ),
                          ),
                          _RemarkChip(
                            text: 'Other',
                            selected: controller.isOtherSelected.value,
                            onTap: controller.toggleOther,
                            isOther: true,
                          ),
                        ],
                      ),

                      if (controller.isOtherSelected.value) ...[
                        SizedBox(height: 16.h),

                        Container(
                          width: double.infinity,
                          height: 180.h,
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: AppColor.neutral200,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: TextField(
                            controller: controller.remarkTextController,
                            maxLines: null,
                            expands: true,
                            decoration: InputDecoration(
                              hintText: 'Write Remark',
                              hintStyle: AppTextStyle.body3_400.copyWith(
                                color: AppColor.neutral400,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: controller.submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.mainprimarykoi,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: AppTextStyle.body3_600.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RemarkChip extends StatelessWidget {
  const _RemarkChip({
    required this.text,
    required this.selected,
    required this.onTap,
    this.isOther = false,
  });

  final String text;
  final bool selected;
  final VoidCallback onTap;
  final bool isOther;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 11.h),
        decoration: BoxDecoration(
          color: selected || isOther && selected
              ? AppColor.primarykoi200
              : AppColor.neutral200,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          text,
          style: AppTextStyle.body3_500.copyWith(color: AppColor.neutral700),
        ),
      ),
    );
  }
}
