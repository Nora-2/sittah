import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glasses/features/checkout/data/models/ShippingMethod.dart';
import 'package:glasses/features/checkout/data/models/payment_method.dart';
import 'package:glasses/features/checkout/data/models/shippingaddress.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutAddressStep());

  void updateAddress(ShippingAddress address) {
   
    emit(CheckoutAddressStep(address: address));
  
  }

  void proceedToShipping(ShippingAddress address) {
   
    emit(CheckoutShippingStep(address: address));
  }

  void selectShippingMethod(ShippingMethod method) {
    if (state is CheckoutShippingStep) {
      final current = state as CheckoutShippingStep;
      emit(CheckoutShippingStep(
        address: current.address!,
        shippingMethod: method,
        expressFastService: current.expressFastService,
      ));
    }
  }

  void toggleExpressService(bool value) {
    if (state is CheckoutShippingStep) {
      final current = state as CheckoutShippingStep;
      emit(CheckoutShippingStep(
        address: current.address!,
        shippingMethod: current.shippingMethod,
        expressFastService: value,
      ));
    } else if (state is CheckoutPaymentStep) {
      final current = state as CheckoutPaymentStep;
      emit(CheckoutPaymentStep(
        address: current.address!,
        shippingMethod: current.shippingMethod!,
        paymentMethod: current.paymentMethod,
        expressFastService: value,
      ));
    }
  }

  void proceedToPayment() {
    if (state is CheckoutShippingStep) {
      final current = state as CheckoutShippingStep;
      if (current.shippingMethod != null) {
        emit(CheckoutPaymentStep(
          address: current.address!,
          shippingMethod: current.shippingMethod!,
          expressFastService: current.expressFastService,
        ));
      }
    }
  }

  void selectPaymentMethod(PaymentMethod method) {
    if (state is CheckoutPaymentStep) {
      final current = state as CheckoutPaymentStep;
      emit(CheckoutPaymentStep(
        address: current.address!,
        shippingMethod: current.shippingMethod!,
        paymentMethod: method,
        expressFastService: current.expressFastService,
      ));
    }
  }

  void goBack() {
    if (state is CheckoutShippingStep) {
      emit(CheckoutAddressStep(address: state.address));
    } else if (state is CheckoutPaymentStep) {
      emit(CheckoutShippingStep(
        address: state.address!,
        shippingMethod: state.shippingMethod,
        expressFastService: state.expressFastService,
      ));
    }
  }
}
