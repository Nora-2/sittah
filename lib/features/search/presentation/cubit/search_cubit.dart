import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:glasses/core/utils/appimage/app_images.dart';
import 'package:glasses/features/search/data/models/search_product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchProducts(String query) async {
    emit(SearchLoading());

    await Future.delayed(const Duration(milliseconds: 500));

    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    final products = _mockProducts.where((p) =>
        p.name.toLowerCase().contains(query.toLowerCase())
    ).toList();

    if (products.isEmpty) {
      emit(SearchEmpty());
    } else {
      emit(
        SearchSuccess(
          products: products,
          categories: _mockCategories,
          popularSearches: _mockPopularSearches,
        ),
      );
    }
  }

  void loadInitialData() {
    emit(
      SearchSuccess(
        products: _mockProducts,
        categories: _mockCategories,
        popularSearches: _mockPopularSearches,
      ),
    );
  }

  // Mock data
  final List<Productsearch> _mockProducts = [
    Productsearch(name: 'فيوجن', price: '400 ج.م', image:Appimage.productBlue),
    Productsearch(name: 'ويستلي', price: '700 ج.م',image:Appimage.productBrown),
    Productsearch(name: 'إيليجانس', price: '800 ج.م', image:Appimage.productBlue),
    Productsearch(name: 'فانتوم', price: '600 ج.م', image:Appimage.productBrown),
  ];

  final List<String> _mockCategories = [
    'نظارية',
    'ساعات',
    'فلوسيت',
    'اكسسوارا',
    'فلوسيت',
    'شنط',
  ];

  final List<String> _mockPopularSearches = [
    'نظارات شمسية',
    'نظارات طبية',
    'نظارات كلاسيك',
  ];
}
