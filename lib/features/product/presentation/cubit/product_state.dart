
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses/features/product/presentation/cubit/product_cubit.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductState());

  void updateValue(String key, String value) {
    final newValues = Map<String, String>.from(state.values);
    newValues[key] = value;
    emit(state.copyWith(values: newValues));
  }

  void openPicker(String key) {
    emit(state.copyWith(activePickerKey: key));
  }

  void closePicker() {
    emit(state.copyWith(clearPicker: true));
  }
}