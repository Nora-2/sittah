class ShippingAddress {
  final String fullName;
  final String phoneNumber;
  final String city;
  final String fullAddress;
  final String apartmentNumber;
  final bool isDefault;

  ShippingAddress({
    required this.fullName,
    required this.phoneNumber,
    required this.city,
    required this.fullAddress,
    required this.apartmentNumber,
    this.isDefault = false,
  });

  ShippingAddress copyWith({
    String? fullName,
    String? phoneNumber,
    String? city,
    String? fullAddress,
    String? apartmentNumber,
    bool? isDefault,
  }) {
    return ShippingAddress(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      fullAddress: fullAddress ?? this.fullAddress,
      apartmentNumber: apartmentNumber ?? this.apartmentNumber,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}