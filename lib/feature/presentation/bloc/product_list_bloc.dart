import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';

import '../../domain/entities/product_enitity.dart';

part 'product_list_event.dart';
part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductListBloc(this._getProductsUseCase) : super(ProductListInitial()) {
    on<ProductListRequested>((event, emit) async {
      try {
        emit(ProductListLoading());
        var products = await _getProductsUseCase.call();
        emit(ProductListLoaded(products));
      } catch (e) {
        print(e);
        emit(ProductListError(e as Error));
      }
    });
  }
}
