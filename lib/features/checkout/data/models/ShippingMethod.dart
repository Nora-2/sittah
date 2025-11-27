class ShippingMethod {
  final String id;
  final String duration;
  final String description;
  final double price;
  final String? note;

  ShippingMethod({
    required this.id,
    required this.duration,
    required this.description,
    required this.price,
    this.note,
  });
}
