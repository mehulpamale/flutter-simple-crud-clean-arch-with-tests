import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source.dart';
import 'package:product_crud_demo/feature/data/repositories/local_repository_impl.dart';

import '../../../test_config/objects.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

void main() {
  late MockLocalDataSource mockLocalDataSource;
  late LocalRepositoryImpl localRepositoryImpl;

  setUp(() {
    mockLocalDataSource = MockLocalDataSource();
    localRepositoryImpl = LocalRepositoryImpl(mockLocalDataSource);
  });

  test("should create and get the products", () async {
    when(() => mockLocalDataSource.createProduct(productEntity)).thenAnswer(
      (realInvocation) async => true,
    );
    expect(await localRepositoryImpl.createProduct(productEntity), true);

    when(() => mockLocalDataSource.getProducts()).thenAnswer(
      (realInvocation) async => [productEntity],
    );
    expect(await localRepositoryImpl.getProducts(), [productEntity]);
  });
}
