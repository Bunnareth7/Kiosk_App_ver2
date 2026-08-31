import 'package:get/get.dart';
import 'package:kiosk_app/app/data/Model/entity/coupon_entity.dart';

class ApplyCouponController extends GetxController {
  // Mock data — no real coupon/promotions backend exists yet.
  final coupons = <CouponEntity>[
    const CouponEntity(
      title: 'KNY Coupon',
      minPurchase: 3,
      expiredDate: '19/3/2025',
      rewardLabel: 'FREE TOPPING',
    ),
    const CouponEntity(
      title: 'KNY Coupon',
      minPurchase: 3,
      expiredDate: '19/3/2025',
      rewardLabel: 'FREE S-SIZED DRINK',
    ),
    const CouponEntity(
      title: 'Stamp Coupon',
      minPurchase: 3,
      expiredDate: '19/3/2025',
      rewardLabel: 'FREE UPSIZE',
    ),
  ].obs;

  void onAddCouponTap() {
  
  }
}