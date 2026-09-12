import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/modules/setting/views/setting_view.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/theme/app_style.dart';
import 'package:kiosk_app/app/widgets/app_inkwell.dart';
import 'package:kiosk_app/app/widgets/number_pad.dart';

class EnterPinView extends StatefulWidget {
  const EnterPinView({super.key});

  static void open() => Get.toNamed(Routes.ENTER_PIN);

  @override
  State<EnterPinView> createState() => _EnterPinViewState();
}

class _EnterPinViewState extends State<EnterPinView> {
  static const int _pinLength = 6;


  static const String _correctPin = '111222';

  String _digits = '';
  bool _showError = false;

  void _onDigitTap(String digit) {
    if (_digits.length >= _pinLength) return;

    setState(() {
      _digits += digit;
      _showError = false;
    });

    if (_digits.length == _pinLength) {
      _validate();
    }
  }

  void _onBackspace() {
    if (_digits.isEmpty) return;
    setState(() {
      _digits = _digits.substring(0, _digits.length - 1);
      _showError = false;
    });
  }

  void _validate() {
    if (_digits == _correctPin) {
      SettingView.open();
      return;
    }

    setState(() => _showError = true);

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) {
        setState(() => _digits = '');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: Column(
        children: [
          _PinHeader(),
          Expanded(
            child: Column(
              children: [
                40.verticalSpace,
                Text(
                  'Please enter your 6 digit PIN',
                  style: AppTextStyle.body2_400
                ),
                24.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < _pinLength; i++) ...[
                      if (i != 0) 10.horizontalSpace,
                      _PinDot(filled: i < _digits.length),
                    ],
                  ],
                ),
                if (_showError) ...[
                  24.verticalSpace,
                  Text(
                    'Incorrect PIN',
                    style: AppTextStyle.body4_500.copyWith(
                      color: AppColor.error500,
                    ),
                  ),
                ],
                const Spacer(),
                NumberPad(
                  onDigit: _onDigitTap,
                  onBackspace: _onBackspace,
                  onConfirm: _validate,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PinHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 48.h,
        color: AppColor.neutral100,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AnimInkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.chevron_left,
                  size: 26.sp,
                  color: AppColor.mainprimarykoi,
                ),
              ),
            ),
            Text('Enter PIN', style: AppTextStyle.body2_600),
          ],
        ),
      ),
    );
  }
}

class _PinDot extends StatelessWidget {
  const _PinDot({required this.filled});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        width: 16.w,
        height: 16.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: filled ? AppColor.mainprimarykoi : AppColor.neutral200,
        ),
      ),
    );
  }
}