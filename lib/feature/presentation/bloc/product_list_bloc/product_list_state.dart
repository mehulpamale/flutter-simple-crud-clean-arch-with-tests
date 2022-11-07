part of 'product_list_bloc.dart';

abstract class ProductListState extends Equatable {
  const ProductListState();
}

class ProductListInitial extends ProductListState {
  @override
  List<Object> get props => [];
}

class ProductListLoading extends ProductListState {
  @override
  List<Object> get props => [];
}

class ProductListLoaded extends ProductListState {
  final List<ProductEntity> products;

  const ProductListLoaded(this.products);

  @override
  List<Object> get props => [];
}

class ProductListError extends ProductListState {
  final Error error;

  const ProductListError(this.error);

  @override
  List<Object> get props => [];
}
