import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/modules/home/views/home_view.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate available width
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth =
        (screenWidth - 40.w - 12.w) / 2; // 40 for padding, 12 for spacing

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 52.h,
          width: buttonWidth > 163.5.w ? 163.5.w : buttonWidth,
          child: AnimInkWell(
            onTap: () {
              HomeView.open();
            },
            child: const _ActionButton(
              label: 'Dine In',
              imagePath: AppPath.overflowKoi,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        SizedBox(
          height: 52.h,
          width: buttonWidth > 163.5.w ? 163.5.w : buttonWidth,
          child: AnimInkWell(
            onTap: () {
              HomeView.open();
            },
            child: const _ActionButton(
              label: 'Take Away',
              imagePath: AppPath.overflowDriver,
            ),
          ),
        ),
      ],
    );
  }
}

// ========== SINGLE ACTION BUTTON (YOUR ORIGINAL DESIGN) ==========
class _ActionButton extends StatelessWidget {
  final String label;
  final String imagePath;

  const _ActionButton({required this.label, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70.h,
            padding: EdgeInsets.only(
              left: AppDecoration.paddingL16,
              right: 70.w,
            ),
            decoration: BoxDecoration(
              color: AppColor.mainprimarykoi,
              borderRadius: BorderRadius.circular(AppDecoration.smallRadius),
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style:AppTextStyle.body2_600.copyWith(color:AppColor.neutral100),
            ),
          ),
          // image overflows above the button
          Positioned(
            right: 10.w,
            top: -20.h,
            bottom: -15.h,
            child: SvgPicture.asset(
              imagePath,
              height: 70.w,
              fit: BoxFit.contain,
              placeholderBuilder: (context) => Container(
                height: 75.w,
                width: 75.w,
                alignment: Alignment.center,
                color: Colors.grey[200],
                child: const Icon(Icons.image, color: AppColor.neutral500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
