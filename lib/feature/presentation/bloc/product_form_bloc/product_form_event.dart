part of 'product_form_bloc.dart';

abstract class ProductFormEvent extends Equatable {
  const ProductFormEvent();
}

class ProductFormSubmitRequested extends ProductFormEvent {
  final ProductEntity product;

  const ProductFormSubmitRequested(this.product);

  @override
  List<Object?> get props => [product];
}
