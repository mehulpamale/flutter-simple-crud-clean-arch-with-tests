import 'package:get/get.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';
import 'package:product_crud_demo/injection_container.dart' as di;

class AddProductScreenController extends GetxController {
  final CreateProductUseCase _createProductUseCase = di.sl();

  Future<bool> onSubmit(ProductEntity productEntity) {
    return _createProductUseCase(productEntity);
  }
}
