import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';
import 'package:product_crud_demo/injection_container.dart';

class AddProductScreenLogicHolder {
  final CreateProductUseCase _createProductUseCase = sl();

  Future<bool> onSubmit(ProductEntity productEntity) {
    return _createProductUseCase(productEntity);
  }
}
