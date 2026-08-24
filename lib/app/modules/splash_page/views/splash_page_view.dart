import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/language_page/views/language_page_view.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      LanguageView.open();
    });
    
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: Stack(
        children: [
          // KOI The - Centered
          Center(
            child: SizedBox(
              height: 200.w,
              width: 200.w,
              child: Image.asset(
                AppPath.koi,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColor.neutral500,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
          ),
          
          // Monakom Logo - Bottom Center
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 100.w,
                height: 35.w,
                child: Image.asset(
                  AppPath.monakomLogo,
                   fit: BoxFit.contain, 
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.business, size: 30.w),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}