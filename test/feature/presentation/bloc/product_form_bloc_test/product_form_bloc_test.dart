import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:product_crud_demo/enums/product_category.dart';
import 'package:product_crud_demo/feature/domain/entities/product_enitity.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_form_bloc/product_form_bloc.dart';

import 'product_form_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<CreateProductUseCase>()])
void main() async {
  var mock = MockCreateProductUseCase();

  var entity = ProductEntity(
      id: "id",
      name: "name",
      category: ProductCategory.consumer,
      createdAt: DateTime.now().toString());

  group("positive", () {
    blocTest("should have nothing at beginning",
        build: () => ProductFormBloc(mock), expect: () => []);

    blocTest(
        "emits [ProductFormLoading(), ProductFormLoaded([entity])] on ProductFormSubmitRequested()",
        setUp: () =>
            when(mock.call(entity)).thenAnswer((_) async => Future.value(true)),
        build: () => ProductFormBloc(mock),
        act: (bloc) {
          bloc.add(
            ProductFormSubmitRequested(entity),
          );
        },
        expect: () =>
            [ProductFormSubmitting(entity), ProductFormSubmitted(entity)]);
  });

  group("negative", () {
    blocTest("emits [ProductFormError] on error",
        setUp: () => when(mock.call(entity)).thenThrow(Error()),
        build: () {
          return ProductFormBloc(mock);
        },
        act: (bloc) => bloc.add(
              ProductFormSubmitRequested(entity),
            ),
        expect: () => [isA<ProductFormSubmitting>(), isA<ProductFormError>()]);
  });
}
