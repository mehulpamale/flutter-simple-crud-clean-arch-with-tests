import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';

import '../remote/data_sources/local_data_source.dart';

class LocalRepositoryImpl implements LocalRepository {
  final LocalDataSource localDataSource;

  LocalRepositoryImpl(this.localDataSource);

  @override
  Future<bool> createProduct(ProductEntity productEntity) {
    return localDataSource.createProduct(productEntity);
  }

  @override
  Future<List<ProductEntity>> getProducts() {
    return localDataSource.getProducts();
  }
}
