import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_app/app/constants/app_decoration.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

class SelectionTerminalView extends StatelessWidget {
  const SelectionTerminalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.verticalSpace,
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      30.verticalSpace,
                      SizedBox(
                        height: 100.w,
                        width: 100.w,
                        child: SvgPicture.asset(
                          AppPath.menuWeb,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: Icon(Icons.error, size: 50.w),
                            );
                          },
                        ),
                      ),
                      10.verticalSpace,
                      // Title
                      Text(
                        'Store and Terminal',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      6.verticalSpace,
                      // Subtitle
                      Text(
                        'Selecting your Store and Terminal',
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      10.verticalSpace,
                      // Store Dropdown
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDecoration.paddingM10,
                          left: AppDecoration.paddingL20,
                          right: AppDecoration.paddingL20,
                        ),
                        child: Container(
                          height: 50.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFecf0f1)),
                            borderRadius: BorderRadius.circular(
                              AppDecoration.mediumRadius,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: null,
                                    hint: Text(
                                      'Store',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    isExpanded: true,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppDecoration.paddingM12,
                                    ),
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Store 1',
                                        child: Text('Store 1'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Store 2',
                                        child: Text('Store 2'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Store 3',
                                        child: Text('Store 3'),
                                      ),
                                    ],
                                    onChanged: null,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Terminal Dropdown
                      Padding(
                        padding: EdgeInsets.only(
                          top: AppDecoration.paddingL20,
                          left: AppDecoration.paddingL20,
                          right: AppDecoration.paddingL20,
                        ),
                        child: Container(
                          height: 50.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFecf0f1)),
                            borderRadius: BorderRadius.circular(
                              AppDecoration.mediumRadius,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: null,
                                    hint: Text(
                                      'Terminal',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    isExpanded: true,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppDecoration.paddingM12,
                                    ),
                                    items: const [
                                      DropdownMenuItem<String>(
                                        value: 'Terminal 1',
                                        child: Text('Terminal 1'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Terminal 2',
                                        child: Text('Terminal 2'),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: 'Terminal 3',
                                        child: Text('Terminal 3'),
                                      ),
                                    ],
                                    onChanged: null,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      30.verticalSpace,

                      // Finish Button
                      Padding(
                        padding: EdgeInsets.only(
                          left: AppDecoration.paddingL20,
                          right: AppDecoration.paddingL20,
                        ),
                        child: Container(
                          width: double.infinity,
                          height: 45.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppDecoration.smallRadius,
                            ),
                            color: AppColor.mainprimarykoi,
                          ),
                          child: Center(
                            child: Text(
                              'Finish',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              370.verticalSpace,

              // Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Powered by Monakom',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF666666),
                    ),
                  ),
                  4.horizontalSpace,
                  SizedBox(
                    width: 80.w,
                    height: 30.w,
                    child: Image.asset(
                      AppPath.monakomLogo,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.business, size: 30.w),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
