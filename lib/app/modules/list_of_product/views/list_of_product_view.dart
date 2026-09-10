import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/widgets/setting_widget.dart';
import 'package:kiosk_app/app/routes/app_pages.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

class ListOfProductsView extends StatefulWidget {
  const ListOfProductsView({super.key});

  static void open() => Get.toNamed(Routes.LIST_OF_PRODUCT);

  @override
  State<ListOfProductsView> createState() => _ListOfProductsViewState();
}

class _ListOfProductsViewState extends State<ListOfProductsView> {

  int _selectedGridIndex = 1;

  static const _options = ['Grid x2', 'Grid x3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.neutral100,
      body: SafeArea(
        child: Column(
          children: [
            const SettingHeader(title: 'List of Products View'),
            Divider(height: 1, thickness: 1, color: AppColor.neutral200),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  for (int i = 0; i < _options.length; i++)
                    SettingSelectableRow(
                      title: _options[i],
                      selected: _selectedGridIndex == i,
                      onTap: () {
                        setState(() => _selectedGridIndex = i);
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
