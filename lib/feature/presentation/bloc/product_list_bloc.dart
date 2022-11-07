import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';

import '../../domain/entities/product_enitity.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductListBloc(this._getProductsUseCase) : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      print("event: $event");
    });

    on<ProductListRequested>((event, emit) async {
      emit(ProductListLoading());
      try {
        var products = await _getProductsUseCase.call();
        emit(ProductListLoaded(products));
      } catch (e) {
        print(e.toString());
        emit(ProductListError(e as Error));
      }
    });
  }
}
