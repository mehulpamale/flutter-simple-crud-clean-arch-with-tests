import 'package:get_it/get_it.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source_impl.dart';
import 'package:product_crud_demo/feature/data/repositories/local_repository_impl.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';

GetIt getIt = GetIt.instance;

Future init() async {
/*  Get.lazyPut(() => GetProductsUseCase());
  Get.lazyPut(() => CreateProductUseCase());
  Get.lazyPut(() => LocalRepositoryImpl());
  Get.lazyPut(() => LocalDataSourceImpl());*/

  getIt.registerFactory<LocalDataSource>(() => LocalDataSourceImpl());
  getIt.registerFactory<LocalRepository>(() => LocalRepositoryImpl());
  getIt.registerFactory<GetProductsUseCase>(() => GetProductsUseCase());
  getIt.registerFactory<CreateProductUseCase>(() => CreateProductUseCase());
}

final LocalRepository localRepository = getIt.get();
final GetProductsUseCase getProductsUseCase = getIt.get();
final CreateProductUseCase createProductUseCase = getIt.get();
final LocalDataSource localDataSource = getIt.get();
