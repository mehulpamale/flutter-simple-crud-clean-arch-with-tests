import 'package:hive/hive.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

@HiveType(typeId: 1)
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String createdAt;
  @HiveField(3)
  ProductCategory category;
  @HiveField(4)
  String? description;

  factory ProductHiveModel.fromProductEntity(ProductEntity productEntity) {
    var description = productEntity.description;
    var id = productEntity.id;
    var name = productEntity.name;
    var category = productEntity.category;
    var createdAt = productEntity.createdAt;
    return ProductHiveModel(
        description: description,
        id: id,
        name: name,
        category: category,
        createdAt: createdAt);
  }

  ProductEntity toProductEntity() {
    return ProductEntity(
      description: description,
      id: id,
      name: name,
      category: category,
      createdAt: createdAt,
    );
  }

  ProductHiveModel(
      {this.description,
      required this.id,
      required this.name,
      required this.category,
      required this.createdAt});
}
