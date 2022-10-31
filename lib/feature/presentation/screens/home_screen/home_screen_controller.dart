import 'package:get/get.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';
import 'package:product_crud_demo/injection_container.dart' as di;

import '../add_product_screen/add_product_screen.dart';

class HomeScreenController extends GetxController {
  List<ProductEntity> products = [];
  var loading = false;
  final GetProductsUseCase getProductsUseCase = di.sl();

  void onButtonPressed() {
    Get.to(() => const AddProductScreen());
  }

  @override
  Future onReady() async {
    loading = true;
    products = await getProductsUseCase.call();
    loading = false;
  }
}
