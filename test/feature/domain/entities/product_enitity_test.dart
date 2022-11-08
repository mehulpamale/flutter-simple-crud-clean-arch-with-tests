import 'package:flutter_test/flutter_test.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

void main() {
  test("two product entities should be equal if their properties are equal",
      () {
    const id = "id";
    const name = "name";
    const category = ProductCategory.industrial;
    final createdAt = DateTime.now().toString();
    const description = "description";

    final entityA = ProductEntity(
        id: id,
        name: name,
        category: category,
        createdAt: createdAt,
        description: description);

    final entityB = ProductEntity(
        id: id,
        name: name,
        category: category,
        createdAt: createdAt,
        description: description);

    expect(entityA == entityB, true);
  });
}
