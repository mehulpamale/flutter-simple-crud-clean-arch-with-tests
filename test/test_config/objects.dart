import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

final productEntity = ProductEntity(
    id: "id",
    name: "name",
    category: ProductCategory.industrial,
    createdAt: DateTime.now().toString(),
    description: "description");
