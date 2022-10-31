import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';

class GetProductsUseCase {
  final LocalRepository _localRepository;

  GetProductsUseCase(this._localRepository);

  Future<List<ProductEntity>> call() {
    return _localRepository.getProducts();
  }
}
