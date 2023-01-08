import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../injection_container.dart';
import '../../../domain/entities/product_enitity.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  ProductListBloc() : super(ProductListInitial()) {
    on<ProductListEvent>((event, emit) async {
      debugPrint("event: $event");
    });

    on<ProductListRequested>((event, emit) async {
      emit(ProductListLoading());
      try {
        var products = await getProductsUseCase();
        emit(ProductListLoaded(products));
      } catch (e) {
        debugPrint(e.toString());
        emit(ProductListError(e as Error));
      }
    });
  }
}
