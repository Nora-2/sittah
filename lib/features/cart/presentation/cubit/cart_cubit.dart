import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glasses/features/cart/data/models/productmodel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());
void toggleItemSelection(int index) {
  final newItems = List<CartItem>.from(state.items);
  final item = newItems[index];
  newItems[index] = item.copyWith(isSelected: !item.isSelected);
  emit(state.copyWith(items: newItems));
}

  void addItem(CartItem item) {
    final items = List<CartItem>.from(state.items)..add(item);
    emit(state.copyWith(items: items));
  }

  void removeItem(int index) {
    final items = List<CartItem>.from(state.items)..removeAt(index);
    emit(state.copyWith(items: items));
  }

void updateQuantity(int index, int quantity) {
  if (quantity < 1) return;

  final updatedItems = List<CartItem>.from(state.items);
  updatedItems[index] = updatedItems[index].copyWith(quantity: quantity);

  emit(state.copyWith(items: updatedItems));
}


  void togglePoints() {
    emit(state.copyWith(usePoints: !state.usePoints));
  }

  void clearCart() {
    emit(const CartState());
  }

  void loadDemoData() {
    addItem(CartItem(
      product: Productcart(
        id: '1',
        name: 'نظارات ويستيل',
        image: '👓',
        price: 500.0,
        options: ['الأسود', 'جاحب الضوء الأزرق', 'نظارات غير طبية'],
      ),
      selectedOption1: 'الأسود',
      selectedOption2: 'جاحب الضوء الأزرق',
      selectedOption3: 'نظارات غير طبية',
    ));

    addItem(CartItem(
      product: Productcart(
        id: '2',
        name: 'نظارات ويستيل',
        image: '👓',
        price: 500.0,
        options: ['الأسود', 'جاحب الضوء الأزرق', 'نظارات غير طبية'],
      ),
      selectedOption1: 'الأسود',
      selectedOption2: 'جاحب الضوء الأزرق',
      selectedOption3: 'نظارات غير طبية',
    ));
  }
}
