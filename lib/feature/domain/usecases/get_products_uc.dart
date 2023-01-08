import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

import '../../../injection_container.dart';

class GetProductsUseCase {
  Future<List<ProductEntity>> call() {
    return localRepository.getProducts();
  }
}
