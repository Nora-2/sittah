import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses/features/rewardandpoints/data/repositories/mockrepo.dart';
import 'package:glasses/features/rewardandpoints/presentation/cubit/copon_state.dart';


class StoreCubit extends Cubit<StoreState> {
  final MockRepository _repository;

  StoreCubit(this._repository) : super(StoreInitial());

  void fetchStoreData() async {
    try {
      emit(StoreLoading());
      
      final products = await _repository.getProducts();
      final allCoupons = await _repository.getCoupons();

      final valid = allCoupons.where((c) => c.isValid).toList();
      final invalid = allCoupons.where((c) => !c.isValid).toList();

      emit(StoreLoaded(
        products: products,
        validCoupons: valid,
        invalidCoupons: invalid,
      ));
    } catch (e) {
      emit(StoreError("Failed to fetch data"));
    }
  }
}