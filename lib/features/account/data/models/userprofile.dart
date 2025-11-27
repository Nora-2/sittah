class UserProfile {
  final String name;
  final String initials;
  final String email;
  final String phone;
  final int growthPoints;
  final int points;
  final int vouchers;
  final int favorites;
  final int cartItems;

  UserProfile({
    required this.name,
    required this.initials,
    required this.email,
    required this.phone,
    required this.growthPoints,
    required this.points,
    required this.vouchers,
    required this.favorites,
    required this.cartItems,
  });
}