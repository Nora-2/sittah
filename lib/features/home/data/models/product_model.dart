class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double rating;
  final String imageUrl; // In a real app, use network URLs
  final bool isFavorite;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
    this.isFavorite = false,
  });
}