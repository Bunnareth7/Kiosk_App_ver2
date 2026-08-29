import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kiosk_app/app/modules/remark/controllers/remark_controller.dart';

class RemarkView extends GetView<RemarkController> {
  const RemarkView({super.key});
  // static void open() => Get.toNamed(Routes.REMARK);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Remark'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add a remark',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 16.h),

            TextField(
              controller: controller.remarkController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your remark...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: controller.saveRemark,
                child: const Text('Save Remark'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
