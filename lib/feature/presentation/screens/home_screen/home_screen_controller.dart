import 'dart:developer';

import 'package:get/get.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';
import 'package:product_crud_demo/injection_container.dart' as di;

import '../add_product_screen/add_product_screen.dart';

class HomeScreenController extends GetxController {
  List<ProductEntity> products = [];
  var loading = false;
  final GetProductsUseCase _getProductsUseCase = di.sl();

  void onButtonPressed() {
    Get.to(() => const AddProductScreen());
  }

  void fetchProducts() {
    log("fetchProducts");
    loading = true;
    _getProductsUseCase.call().then((value) {
      loading = false;
      products = value;
      update();
      onFetched?.call(products);
    });
  }

  Function(List<ProductEntity> products)? onFetched;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
}
