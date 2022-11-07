part of 'product_form_bloc.dart';

abstract class ProductFormState extends Equatable {
  const ProductFormState();
}

class ProductFormInitial extends ProductFormState {
  @override
  List<Object> get props => [];
}

class ProductFormSubmitting extends ProductFormState {
  final ProductEntity product;

  const ProductFormSubmitting(this.product);

  @override
  List<Object> get props => [];
}

class ProductFormSubmitted extends ProductFormState {
  final ProductEntity product;

  const ProductFormSubmitted(this.product);

  @override
  List<Object> get props => [];
}

class ProductFormError extends ProductFormState {
  final Error error;

  const ProductFormError(this.error);

  @override
  List<Object> get props => [];
}
