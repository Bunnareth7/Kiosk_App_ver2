import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/option_chip.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/order_option_header.dart';

class IceLevelSection extends StatelessWidget {
  const IceLevelSection({super.key, required this.selectedIndex, required this.onSelect});

 
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  static const List<String> labels = [
    'No Ice',
    'Less Ice',
    'Normal Ice',
    'More Ice'
  ];

  // PNG images for each ice level
  static const List<String> imagePaths = [
    AppPath.noIce,
    AppPath.lessIce,
    AppPath.normalIce,
    AppPath.moreIce,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderOptionSectionHeader(title: 'Ice Level', requiredCount: 1),
        12.verticalSpace,
        Row(
          children: List.generate(labels.length, (index) {
            return Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index < labels.length - 1 ? 8.w : 0,
                ),
                child: OptionChip(
                  label: labels[index],
                 onTap: () => onSelect(index),
                  isSelected: selectedIndex == index,
                  imagePath: imagePaths[index],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}