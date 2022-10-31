import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

class ProductModel extends ProductEntity {
  const ProductModel(
      {required super.id,
      required super.name,
      required super.category,
      required super.createdAt});
}
