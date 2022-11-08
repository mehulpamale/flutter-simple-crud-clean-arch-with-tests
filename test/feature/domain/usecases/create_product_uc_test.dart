import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';

import '../../../test_config/objects.dart';

class MockLocalRepository extends Mock implements LocalRepository {}

void main() {
  late LocalRepository localRepository;
  late CreateProductUseCase createProductUseCase;
  setUp(() {
    localRepository = MockLocalRepository();
    createProductUseCase = CreateProductUseCase(localRepository);
  });

  test("should return true after creating the product", () async {
    when(() => localRepository.createProduct(productEntity))
        .thenAnswer((invocation) async => true);
    expect(await createProductUseCase(productEntity), true);
  });
}
