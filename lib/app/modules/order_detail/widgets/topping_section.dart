import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/order_option_header.dart';

import 'option_chip.dart';

class ToppingSection extends StatelessWidget {
  const ToppingSection({super.key, required this.selectedIndexes, required this.onToggle});

   final Set<int> selectedIndexes;
  final ValueChanged<int> onToggle;

  static const List<String> labels = [
    'Bubble',
    'Golden Silky',
    'Golden Bubble',
    'Konjac Ball',
  ];
  static const List<String> imagePaths = [
    AppPath.emptyImage,
    AppPath.emptyImage,
    AppPath.emptyImage,
    AppPath.emptyImage,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderOptionSectionHeader(title: 'Topping'),
        12.verticalSpace,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: List.generate(labels.length, (index) {
            return SizedBox(
              width: (Get.width - 32.w - 24.w) / 4,
              child: OptionChip(
                label: labels[index],
                onTap: () => onToggle(index),
                isSelected: selectedIndexes.contains(index),
                imagePath: imagePaths[index],
              ),
            );
          }),
        ),
      ],
    );
  }
}
