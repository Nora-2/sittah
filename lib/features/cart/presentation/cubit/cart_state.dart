part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItem> items;
  final bool usePoints;
  final int pointsUsed;

  const CartState({
    this.items = const [],
    this.usePoints = false,
    this.pointsUsed = 2,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);
  double get discount => usePoints ? pointsUsed * 50.0 : 0;
  double get deliveryFee => 180.0;
  double get total => subtotal - discount + deliveryFee;
  int get itemCount => items.length;

  CartState copyWith({
    List<CartItem>? items,
    bool? usePoints,
    int? pointsUsed,
  }) {
    return CartState(
      items: items ?? this.items,
      usePoints: usePoints ?? this.usePoints,
      pointsUsed: pointsUsed ?? this.pointsUsed,
    );
  }

  @override
  List<Object?> get props => [items, usePoints, pointsUsed];
}
