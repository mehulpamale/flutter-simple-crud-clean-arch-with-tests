import 'package:mobx/mobx.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/injection_container.dart';

class AppStore {}

@StoreConfig()
class ProductListStore {
  @observable
  ObservableFuture<List<ProductEntity>>? records;

  @action
  void clearRecords() {
    runInAction(() {
      records = null;
    });
  }

  @action
  void fetchProducts() {
    runInAction(() {
      records = ObservableFuture(getProductsUseCase.call());
    });
  }
}
