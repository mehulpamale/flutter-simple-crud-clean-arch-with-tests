import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';

class GetProductUseCase {
  final LocalRepository _localRepository;

  GetProductUseCase(this._localRepository);

  void call() {
    _localRepository.getProducts();
  }
}
