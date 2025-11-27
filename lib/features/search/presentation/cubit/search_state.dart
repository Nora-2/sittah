part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchEmpty extends SearchState {}

class SearchSuccess extends SearchState {
  final List<Product> products;
  final List<String> categories;
  final List<String> popularSearches;

  const SearchSuccess({
    required this.products,
    required this.categories,
    required this.popularSearches,
  });

  @override
  List<Object?> get props => [products, categories, popularSearches];
}
