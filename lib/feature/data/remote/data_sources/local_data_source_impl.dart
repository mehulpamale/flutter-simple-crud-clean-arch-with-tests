import 'package:hive/hive.dart';
import 'package:product_crud_demo/feature/data/remote/hive/models/product_hive_model.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';

import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  var mBox = Hive.box("products");

  @override
  Future<bool> createProduct(ProductEntity productEntity) async {
    await mBox.add(ProductHiveModel.fromProductEntity(productEntity));
    return true;
  }

  @override
  Future<List<ProductEntity>> getProducts() {
    var t = Future.value(mBox.values.map((e) {
      var pe = (e as ProductHiveModel).toProductEntity();
      return pe;
    }).toList());
    return t;
  }
}
