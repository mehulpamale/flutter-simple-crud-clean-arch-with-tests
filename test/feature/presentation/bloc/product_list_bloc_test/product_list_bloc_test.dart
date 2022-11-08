import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_list_bloc/product_list_bloc.dart';

import 'product_list_bloc_test.mocks.dart';


@GenerateNiceMocks([MockSpec<GetProductsUseCase>()])
void main() async {
  var createProductUseCase = MockGetProductsUseCase();

  var entity = ProductEntity(
      id: "id",
      name: "name",
      category: ProductCategory.consumer,
      createdAt: DateTime.now().toString());

  group("positive", () {
    test("should be ProductFormInitial at the beginning", () {
      expect(ProductListBloc(createProductUseCase).state,
          isA<ProductListInitial>());
    });

    blocTest(
        "emits [ProductListLoading(), ProductListLoaded([entity])] on ProductListRequested()",
        setUp: () =>
            when(createProductUseCase.call()).thenAnswer((_) async => Future.value([entity])),
        build: () => ProductListBloc(createProductUseCase),
        act: (bloc) {
          bloc.add(
            ProductListRequested(),
          );
        },
        expect: () => [
              ProductListLoading(),
              ProductListLoaded([entity])
            ]);
  });

  group("negative", () {
    blocTest("emits [ProductListError] on error",
        setUp: () => when(createProductUseCase.call()).thenThrow(Error()),
        build: () {
          return ProductListBloc(createProductUseCase);
        },
        act: (bloc) => bloc.add(
              ProductListRequested(),
            ),
        expect: () => [isA<ProductListLoading>(), isA<ProductListError>()]);
  });
}
