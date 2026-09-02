import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/order_option_header.dart';

import 'option_chip.dart';

class SugarLevelSection extends StatelessWidget {
  const SugarLevelSection({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelect;
  static const List<String> labels = [
    '0%',
    '25%',
    '50%',
    '70%',
    '100%',
    '120%',
  ];

  static const List<String> imagePaths = [
    AppPath.sugar20,
    AppPath.sugar50,
    AppPath.sugar70,
    AppPath.sugar70,
    AppPath.sugar70,
    AppPath.sugar70,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderOptionSectionHeader(title: 'Sugar Level', requiredCount: 1),
        12.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: List.generate(labels.length, (index) {
            return SizedBox(
              width: (Get.width - 32.w - 24.w) / 4,
             child: OptionChip(
                label: labels[index],
                isSelected: selectedIndex == index,
                onTap: () => onSelect(index),
                imagePath: imagePaths[index],
              ),
            );
          }),
        ),
      ],
    );
  }
}
