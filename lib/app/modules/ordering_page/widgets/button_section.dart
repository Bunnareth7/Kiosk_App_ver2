import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/ordering_page/widgets/action_button.dart';
import 'package:kiosk_app/app/modules/ordering_page/widgets/footer_widget.dart';
import 'package:kiosk_app/app/theme/app_style.dart';

class BottomSection extends StatelessWidget {
  const BottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: AppDecoration.paddingL20,
        vertical: AppDecoration.paddingM12,
      ),
      child: Column(
        children: [
          const _MemberCouponRow(),
          SizedBox(height: 12.h),
          const ActionButtons(),
          SizedBox(height: 12.h),
          const _FlagRow(),
          SizedBox(height: 12.h),
          const PaymentFooter(),
        ],
      ),
    );
  }
}

// ========== MEMBER / COUPON ROW ==========
class _MemberCouponRow extends StatelessWidget {
  const _MemberCouponRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _MemberCouponItem(icon: AppPath.profileIcon, label: 'Member'),
        SizedBox(width: 40.w),
        const _MemberCouponItem(icon: AppPath.actionIcon, label: 'Coupon'),
      ],
    );
  }
}

class _MemberCouponItem extends StatelessWidget {
  final String icon;
  final String label;
  const _MemberCouponItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width: 20.w,
          height: 20.w,
          colorFilter: const ColorFilter.mode(Colors.black87, BlendMode.srcIn),
        ),
        SizedBox(width: 6.w),
        Text(label, style: AppTextStyle.body3_500),
      ],
    );
  }
}

// ========== FLAG ROW ==========
class _FlagRow extends StatelessWidget {
  const _FlagRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _FlagCircle(AppPath.cambodiaFlag),
        SizedBox(width: 15.w),
        const _FlagCircle(AppPath.unitedKingdomFlag),
        SizedBox(width: 15.w),
        const _FlagCircle(AppPath.chinaFlag),
      ],
    );
  }
}

class _FlagCircle extends StatelessWidget {
  final String assetPath;
  const _FlagCircle(this.assetPath);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 32.w,
        height: 32.w,
        color: Colors.grey[200],
        child: SvgPicture.asset(
          assetPath,
          fit: BoxFit.cover,
          placeholderBuilder: (_) =>
              Icon(Icons.flag_outlined, size: 16.w, color: Colors.grey),
        ),
      ),
    );
  }
}
