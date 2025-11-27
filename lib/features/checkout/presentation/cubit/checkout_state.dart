part of 'checkout_cubit.dart';


abstract class CheckoutState extends Equatable {
  final ShippingAddress? address;
  final ShippingMethod? shippingMethod;
  final PaymentMethod? paymentMethod;
  final bool expressFastService;

  const CheckoutState({
    this.address,
    this.shippingMethod,
    this.paymentMethod,
    this.expressFastService = false,
  });

  int get currentStep;

  @override
  List<Object?> get props => [
        address,
        shippingMethod,
        paymentMethod,
        expressFastService,
      ];
}

// -------------------- STEP 0 --------------------
class CheckoutInitial extends CheckoutState {
  const CheckoutInitial() : super();

  @override
  int get currentStep => 0;
}

class CheckoutAddressStep extends CheckoutState {
  const CheckoutAddressStep({
    super.address,
  });

  @override
  int get currentStep => 0;
}

// -------------------- STEP 1 --------------------
class CheckoutShippingStep extends CheckoutState {
  const CheckoutShippingStep({
    required ShippingAddress super.address,
    super.shippingMethod,
    super.expressFastService,
  });

  @override
  int get currentStep => 1;
}

// -------------------- STEP 2 --------------------
class CheckoutPaymentStep extends CheckoutState {
  const CheckoutPaymentStep({
    required ShippingAddress super.address,
    required ShippingMethod super.shippingMethod,
    super.paymentMethod,
    super.expressFastService,
  });

  @override
  int get currentStep => 2;
}