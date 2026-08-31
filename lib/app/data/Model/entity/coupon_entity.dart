class CouponEntity {
  final String title;
  final double minPurchase;
  final String expiredDate;
  final String rewardLabel;
  final String? imagePath;

  const CouponEntity({
    required this.title,
    required this.minPurchase,
    required this.expiredDate,
    required this.rewardLabel,
    this.imagePath,
  });
}