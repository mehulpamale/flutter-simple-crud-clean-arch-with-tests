import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source.dart';
import 'package:product_crud_demo/feature/data/repositories/local_repository_impl.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';
import 'package:product_crud_demo/injection_container.dart';

import '../../../helpers/mocks.dart';
import '../../../test_config/objects.dart';

class MockLocalRepository extends Mock implements LocalRepository {}

void main() {
  setUp(() {
    getIt.registerSingleton<LocalDataSource>(MockLocalDataSource());
    getIt.registerSingleton<LocalRepository>(LocalRepositoryImpl());
    getIt.registerSingleton<GetProductsUseCase>(MockGetProductsUseCase());
    getIt.registerSingleton<CreateProductUseCase>(MockCreateProductUseCase());
  });
  tearDown(() => getIt.reset());

  test("should return true after creating the product", () async {
    when(() => localRepository.createProduct(productEntity))
        .thenAnswer((invocation) async => true);
    expect(await createProductUseCase(productEntity), true);
  });
}
