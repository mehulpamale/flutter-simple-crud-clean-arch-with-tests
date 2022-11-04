part of 'product_list_bloc.dart';

abstract class ProductListEvent extends Equatable {
  const ProductListEvent();
}

class ProductListRequested extends ProductListEvent {
  @override
  List<Object?> get props => [];
}
