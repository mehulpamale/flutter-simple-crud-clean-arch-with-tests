import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';

class CreateProductUseCase {
  final LocalRepository _localRepository;

  CreateProductUseCase(this._localRepository);

  void call(ProductEntity productEntity) {
    _localRepository.createProduct(productEntity);
  }
}
