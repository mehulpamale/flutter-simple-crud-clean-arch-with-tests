import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';

class CreateProductUseCase {
  final LocalRepository _localRepository;

  CreateProductUseCase(this._localRepository);

  Future<bool> call(ProductEntity productEntity) {
    return _localRepository.createProduct(productEntity);
  }
}
