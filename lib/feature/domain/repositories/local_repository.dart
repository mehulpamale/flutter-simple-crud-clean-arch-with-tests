import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

abstract class LocalRepository {
  Future<bool> createProduct(ProductEntity productEntity);
  Future<List<ProductEntity>> getProducts();
}
