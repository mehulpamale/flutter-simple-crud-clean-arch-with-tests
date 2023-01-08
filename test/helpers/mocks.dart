import 'package:mocktail/mocktail.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';

class MockLocalDataSource extends Mock implements LocalDataSource {}

class MockCreateProductUseCase extends Mock implements CreateProductUseCase {}

class MockGetProductsUseCase extends Mock implements GetProductsUseCase {}
