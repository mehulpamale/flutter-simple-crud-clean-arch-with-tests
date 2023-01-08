import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

import '../../../injection_container.dart';

class CreateProductUseCase {
  Future<bool> call(ProductEntity productEntity) {
    return localRepository.createProduct(productEntity);
  }
}
