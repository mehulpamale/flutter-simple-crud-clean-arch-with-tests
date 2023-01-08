import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_list_bloc/product_list_bloc.dart';
import 'package:product_crud_demo/injection_container.dart';

void main() async {
  var entity = ProductEntity(
      id: "id",
      name: "name",
      category: ProductCategory.consumer,
      createdAt: DateTime.now().toString());

  group("positive", () {
    test("should be ProductFormInitial at the beginning", () {
      expect(ProductListBloc().state, ProductListInitial());
    });

    blocTest(
        "emits [ProductListLoading(), ProductListLoaded([entity])] on ProductListRequested()",
        setUp: () => when(() => createProductUseCase.call(entity))
            .thenAnswer((_) async => true),
        build: () => ProductListBloc(),
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
        setUp: () =>
            when(() => createProductUseCase.call(entity)).thenThrow(Error()),
        build: () {
          return ProductListBloc();
        },
        act: (bloc) => bloc.add(
              ProductListRequested(),
            ),
        expect: () => [isA<ProductListLoading>(), isA<ProductListError>()]);
  });
}
