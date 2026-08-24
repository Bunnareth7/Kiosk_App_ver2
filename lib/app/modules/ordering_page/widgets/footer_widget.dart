import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/constants/app_path.dart';

class PaymentFooter extends StatelessWidget {
  const PaymentFooter({super.key});

  final List<String> paymentIcons = const [
    AppPath.payment,
    AppPath.khqr,
    AppPath.visaLogo,
    AppPath.mastercard,
    AppPath.wallet,
    AppPath.unionPay,
    AppPath.alipay,
    AppPath.wepay,
    //AppPath.jbc,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _MonakomLogo(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: AppDecoration.paddingM12),
            child: Wrap(
              alignment: WrapAlignment.end,
              spacing: AppDecoration.paddingS6,
              runSpacing: AppDecoration.paddingS4,
              children: paymentIcons.map((path) => _PaymentIcon(path)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class _MonakomLogo extends StatelessWidget {
  const _MonakomLogo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.w,
      height: 30.w,
      child: Image.asset(
        AppPath.monakomLogo,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) =>
            Container(height: 28.w, width: 90.w, color: Colors.grey[200]),
      ),
    );
  }
}

class _PaymentIcon extends StatelessWidget {
  final String assetPath;
  const _PaymentIcon(this.assetPath);

  @override
  Widget build(BuildContext context) {
    final isSvg = assetPath.toLowerCase().endsWith('.svg');

    return SizedBox(
      height: 18.w,
      width: 25.w,
      child: isSvg
          ? SvgPicture.asset(
              assetPath,
              fit: BoxFit.contain,
              placeholderBuilder: (_) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black26),
                  color: Colors.grey[200],
                ),
              ),
            )
          : Image.asset(
              assetPath,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(color: Colors.grey[200]),
            ),
    );
  }
}
