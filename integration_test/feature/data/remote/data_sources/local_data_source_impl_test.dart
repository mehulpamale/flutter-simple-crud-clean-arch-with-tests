import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source_impl.dart';
import 'package:product_crud_demo/feature/data/remote/hive/models/product_hive_model.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/injection_container.dart';

void main() {
  group("LocalDataSourceImpl test", () {
    setUp(() async {
      await Hive.initFlutter();
      Hive.registerAdapter(ProductHiveModelAdapter());
      await Hive.openBox("products");
    });
    tearDown(() => getIt.reset());

    test("LocalDataSourceImpl should create product", () async {
      var localDataStore = LocalDataSourceImpl();
      var entity = ProductEntity(
          id: "id",
          name: "name",
          category: ProductCategory.industrial,
          createdAt: DateTime.now().toString(),
          description: "description");
      await localDataStore.createProduct(entity);
      var products = await localDataStore.getProducts();
      expect(products[0], entity);
    });
  });
}
