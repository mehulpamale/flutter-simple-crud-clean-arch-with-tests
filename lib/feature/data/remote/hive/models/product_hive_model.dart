import 'package:hive/hive.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

part 'product_hive_model.g.dart';

@HiveType(typeId: 0)
class ProductHiveModel extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String createdAt;
  @HiveField(3)
  String category;
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
        category: category.name,
        createdAt: createdAt);
  }

  ProductEntity toProductEntity() {
    return ProductEntity(
      description: description,
      id: id,
      name: name,
      category: ProductCategory.values
          .firstWhere((element) => element.name == category),
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
