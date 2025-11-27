
enum PaymentMethodType { card, klarna, afterpay, paypal }

class PaymentMethod {
  final PaymentMethodType type;
  final String title;
  final String? subtitle;
  final String? iconPath;

  PaymentMethod({
    required this.type,
    required this.title,
    this.subtitle,
    this.iconPath,
  });
}