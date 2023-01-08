import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source.dart';
import 'package:product_crud_demo/feature/data/repositories/local_repository_impl.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';
import 'package:product_crud_demo/injection_container.dart';

import '../../../helpers/mocks.dart';
import '../../../test_config/objects.dart';

void main() {
  setUp(() {
    getIt.registerSingleton<LocalDataSource>(MockLocalDataSource());
    getIt.registerSingleton<LocalRepository>(LocalRepositoryImpl());
  });

  tearDown(() => getIt.reset());
 
  test("should create and get the products", () async {
    when(() => localDataSource.createProduct(productEntity)).thenAnswer(
      (realInvocation) async => true,
    );
    expect(await localRepository.createProduct(productEntity), true);

    when(() => localDataSource.getProducts()).thenAnswer(
      (realInvocation) async => [productEntity],
    );
    expect(await localRepository.getProducts(), [productEntity]);
  });
}
