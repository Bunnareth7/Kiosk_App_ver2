// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:kiosk_app/app/theme/app_color.dart';
// import 'package:kiosk_app/app/theme/app_style.dart';
// import 'package:kiosk_app/app/widgets/number_pad.dart';

// class QuantityInputDialog extends StatefulWidget {
//   const QuantityInputDialog({super.key, required this.initialQuantity});

//   final int initialQuantity;

//   /// Returns the new quantity, or null if cancelled.
//   /// A returned value of 0 means the caller should remove the item.
//   static Future<int?> show({required int initialQuantity}) {
//     Get.focusScope?.unfocus();
//     return Get.dialog<int>(
//       _QuantityInputDialogWrapper(initialQuantity: initialQuantity),
//       barrierDismissible: true,
//       barrierColor: Colors.black.withValues(alpha: 0.25),
//     );
//   }

//   @override
//   State<QuantityInputDialog> createState() => _QuantityInputDialogState();
// }

// class _QuantityInputDialogWrapper extends StatelessWidget {
//   const _QuantityInputDialogWrapper({required this.initialQuantity});

//   final int initialQuantity;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//             child: const SizedBox.expand(),
//           ),
//         ),
//         QuantityInputDialog(initialQuantity: initialQuantity),
//       ],
//     );
//   }
// }

// class _QuantityInputDialogState extends State<QuantityInputDialog> {
//   late String _digits;

//   @override
//   void initState() {
//     super.initState();
//     _digits = '${widget.initialQuantity}';
//   }

//   void _onDigitTap(String digit) {
//     setState(() {
//       if (_digits == '0') {
//         _digits = digit;
//       } else if (_digits.length < 4) {
//         _digits += digit;
//       }
//     });
//   }

//   void _onBackspace() {
//     setState(() {
//       if (_digits.length <= 1) {
//         _digits = '0';
//       } else {
//         _digits = _digits.substring(0, _digits.length - 1);
//       }
//     });
//   }

//   void _apply() {
//     final value = int.tryParse(_digits);
//     if (value == null || value < 0) return;
//     Get.back(result: value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Center(child: _buildDialogCard()),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: NumberPad(
//             onDigit: _onDigitTap,
//             onBackspace: _onBackspace,
//             onConfirm: _apply,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDialogCard() {
//     return Dialog(
//       backgroundColor: AppColor.neutral100,
//       insetPadding: EdgeInsets.symmetric(horizontal: 84.w),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//       child: SizedBox(
//         width: 238.w,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('Update Quantity', style: AppTextStyle.body2_700),

//               20.verticalSpace,

//               Text(
//                 _digits,
//                 textAlign: TextAlign.center,
//                 style: AppTextStyle.body1_500.copyWith(
//                   color: AppColor.neutral400,
//                 ),
//               ),

//               20.verticalSpace,

//               Row(
//                 children: [
//                   Expanded(
//                     child: SizedBox(
//                       height: 32.h,
//                       child: GestureDetector(
//                         onTap: () => Get.back(),
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             border: Border.all(color: AppColor.mainprimarykoi),
//                             borderRadius: BorderRadius.circular(8.r),
//                           ),
//                           child: Text(
//                             'CANCEL',
//                             style: AppTextStyle.body3_600.copyWith(
//                               color: AppColor.mainprimarykoi,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   10.horizontalSpace,

//                   Expanded(
//                     child: SizedBox(
//                       height: 32.h,
//                       child: GestureDetector(
//                         onTap: _apply,
//                         child: Container(
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: AppColor.mainprimarykoi,
//                             borderRadius: BorderRadius.circular(8.r),
//                           ),
//                           child: Text(
//                             'APPLY',
//                             style: AppTextStyle.body3_600.copyWith(
//                               color: AppColor.neutral100,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }