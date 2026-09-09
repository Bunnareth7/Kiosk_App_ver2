import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';
import 'package:kiosk_app/app/widgets/setting_widget.dart';

class _LanguageOption {
  const _LanguageOption({required this.title, this.subtitle});

  final String title;
  final String? subtitle;
}

class DefaultLanguageView extends StatefulWidget {
  const DefaultLanguageView({super.key});

  static void open() => Get.toNamed(Routes.DEFUALT_LANG_SETTING);

  @override
  State<DefaultLanguageView> createState() => _DefaultLanguageViewState();
}

class _DefaultLanguageViewState extends State<DefaultLanguageView> {
  
  int _selectedIndex = 0;

  static const _options = [
    _LanguageOption(title: 'English',),
    _LanguageOption(title: 'ខ្មែរ', subtitle: 'Khmer'),
    _LanguageOption(title: '中文', subtitle: 'Chinese'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Column(
          children: [
            const SettingHeader(title: 'Default Language'),
            Divider(height: 1, thickness: 1, color: AppColor.neutral200),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  for (int i = 0; i < _options.length; i++)
                    SettingSelectableRow(
                      title: _options[i].title,
                      subtitle: _options[i].subtitle,
                      selected: _selectedIndex == i,
                      onTap: () {
                        setState(() => _selectedIndex = i);
                     
                      },
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
