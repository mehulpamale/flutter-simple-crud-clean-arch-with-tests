import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product_enitity.dart';
import '../../../domain/usecases/create_product_uc.dart';

part 'product_form_event.dart';

part 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  final CreateProductUseCase _createProductUseCase;

  ProductFormBloc(this._createProductUseCase) : super(ProductFormInitial()) {
    on<ProductFormSubmitRequested>((event, emit) async {
      var product = event.product;
      emit(ProductFormSubmitting(product));
      try {
        var res = await _createProductUseCase(product);
        if (res) {
          emit(ProductFormSubmitted(product));
        } else {
          emit(ProductFormError(Error()));
        }
      } catch (e) {
        print(e.toString());
        emit(ProductFormError(e as Error));
      }
    });
  }
}
