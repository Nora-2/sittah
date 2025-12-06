

import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String id;
  final String date;
  final String status; // "Delivered" or "Processing"
  final double total;
  final String productName;
  final String productDetails;
  final int quantity;
  
  // Details specific fields
  final String userName;
  final String address;
  final String phone;
  final double subtotal;
  final double shipping;
  final double tax;
  final String deliveryTime;

  const OrderModel({
    required this.id,
    required this.date,
    required this.status,
    required this.total,
    required this.productName,
    required this.productDetails,
    required this.quantity,
    required this.userName,
    required this.address,
    required this.phone,
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.deliveryTime,
  });

  @override
  List<Object?> get props => [id];
}

// Mock Data matching the screenshot
final List<OrderModel> mockOrders = [
  const OrderModel(
    id: "101560718",
    date: "29 سبتمبر 2025 - 9 مساءً",
    status: "Delivered", // 'وصل'
    total: 500,
    productName: "نظارات ويستلي",
    productDetails: "الأسود\n حاجب الضوء الأزرق\nنظارات غير طبية",
    quantity: 1,
    userName: "عبد الله عبدالحميد",
    address: "30 شارع مصطفي حامد، طنطا",
    phone: "+20 01155856594",
    subtotal: 67.90,
    shipping: 6.95,
    tax: 5.99,
    deliveryTime: "30 سبتمبر 2025",
  ),
  
   const OrderModel(
    id: "101560720",
    date: "25 سبتمبر 2025 - 1 مساءً",
    status: "Delivered",
    total: 500,
    productName: "نظارات ويستلي",
    productDetails: "الأسود \n حاجب الضوء الأزرق",
    quantity: 1,
    userName: "عبد الله عبدالحميد",
    address: "30 شارع مصطفي حامد، طنطا",
    phone: "+20 01155856594",
    subtotal: 67.90,
    shipping: 6.95,
    tax: 5.99,
    deliveryTime: "26 سبتمبر 2025",
  ),
];