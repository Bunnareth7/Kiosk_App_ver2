import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiosk_app/app/theme/app_color.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imageList;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;

  const ImageSlider({
    super.key,
    required this.imageList,
    required this.currentIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450.h,

      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 1.0,
              onPageChanged: (index, reason) => onPageChanged(index),
            ),
            items: imageList.map((path) => _buildImage(path)).toList(),
          ),
          _DotIndicator(count: imageList.length, currentIndex: currentIndex),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      width: double.infinity,
      errorBuilder: (_, __, ___) => Container(
        color: Colors.grey[200],
        child: Icon(
          Icons.image_not_supported,
          size: 50.w,
          color: AppColor.neutral500,
        ),
      ),
    );
  }
}
class _DotIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const _DotIndicator({required this.count, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30.h,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(count, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: currentIndex == index ? 20.w : 14.w,
            height: 2.5.h,
            margin: EdgeInsets.symmetric(horizontal: 3.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
              color: currentIndex == index
                  ? const Color(0xFFF89830)
                  : Colors.white.withOpacity(0.7),
            ),
          );
        }),
      ),
    );
  }
}
