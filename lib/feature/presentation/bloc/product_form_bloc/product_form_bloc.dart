import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../domain/entities/product_enitity.dart';

part 'product_form_event.dart';
part 'product_form_state.dart';

class ProductFormBloc extends Bloc<ProductFormEvent, ProductFormState> {
  ProductFormBloc() : super(ProductFormInitial()) {
    on<ProductFormSubmitRequested>((event, emit) async {
      var product = event.product;
      emit(ProductFormSubmitting(product));
      try {
        var res = await createProductUseCase(product);
        if (res) {
          emit(ProductFormSubmitted(product));
        } else {
          emit(ProductFormError(Error()));
        }
      } catch (e) {
        debugPrint(e.toString());
        emit(ProductFormError(e as Error));
      }
    });
  }
}
