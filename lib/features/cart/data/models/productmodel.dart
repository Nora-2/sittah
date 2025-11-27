class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final List<String> options;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.options,
  });
}

class CartItem {
  final Product product;
  int quantity;
  final String selectedOption1;
  final String selectedOption2;
  final String selectedOption3;
  bool isSelected;
  CartItem({
    required this.product,
    this.quantity = 1,
    required this.selectedOption1,
    required this.selectedOption2,
    required this.selectedOption3,
    this.isSelected = false,
  });

  double get totalPrice => product.price * quantity;

  CartItem copyWith({int? quantity, bool? isSelected}) {
    return CartItem(
     product: product,
      quantity: quantity ?? this.quantity,
      selectedOption1: selectedOption1,
      selectedOption2: selectedOption2,
      selectedOption3: selectedOption3,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
