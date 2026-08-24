// cup_size_section.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/constants/app_path.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/option_chip.dart';
import 'package:kiosk_app/app/modules/order_detail/widgets/order_option_header.dart';

class CupSizeSection extends StatelessWidget {
  const CupSizeSection({
    super.key,
    required this.basePrice,
    required this.extraPrices,
    required this.selectedIndex,
    required this.onSelect,
  });

  final double basePrice;
  final List<double> extraPrices;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  static const List<String> labels = ['Small', 'Medium', 'Large'];
  static const List<String> imagePaths = [
    AppPath.cupSize,
    AppPath.emptyImage,
    AppPath.emptyImage,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const OrderOptionSectionHeader(title: 'Cup Size', requiredCount: 1),
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
                  priceLabel:
                      '\$${(basePrice + index * 0.9).toStringAsFixed(1)}',
                  isSelected: selectedIndex == index,
                  onTap: () => onSelect(index),
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
