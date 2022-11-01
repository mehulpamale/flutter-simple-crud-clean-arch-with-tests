import 'package:flutter_test/flutter_test.dart';
import 'package:product_crud_demo/enums/product_category.dart';

void main() {
  test("enum values test", () {
    expect(ProductCategory.values.length, 2);
    expect(ProductCategory.values[0].name, "consumer");
    expect(ProductCategory.values[1].name, "industrial");
  });
}
