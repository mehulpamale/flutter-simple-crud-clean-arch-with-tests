import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';

import '../../../test_config/objects.dart';

class MockLocalRepository extends Mock implements LocalRepository {}

void main() {
  late LocalRepository localRepository;
  late GetProductsUseCase getProductsUseCase;
  setUp(() {
    localRepository = MockLocalRepository();
    getProductsUseCase = GetProductsUseCase(localRepository);
  });

  test("should return list of products", () async {
    when(() => localRepository.getProducts())
        .thenAnswer((invocation) async => [productEntity]);
    expect(await getProductsUseCase(), [productEntity]);
  });
}
