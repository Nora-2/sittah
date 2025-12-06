class CouponModel {
  final int id;
  final String title;
  final String description;
  final String discountAmount;
  final String expiryDate;
  final bool isValid;

  CouponModel({
    required this.id,
    required this.title,
    required this.description,
    required this.discountAmount,
    required this.expiryDate,
    required this.isValid,
  });
}