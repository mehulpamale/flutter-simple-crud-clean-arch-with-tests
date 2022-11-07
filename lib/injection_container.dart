import 'package:get_it/get_it.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source.dart';
import 'package:product_crud_demo/feature/data/remote/data_sources/local_data_source_impl.dart';
import 'package:product_crud_demo/feature/data/repositories/local_repository_impl.dart';
import 'package:product_crud_demo/feature/domain/repositories/local_repository.dart';
import 'package:product_crud_demo/feature/domain/usecases/create_product_uc.dart';
import 'package:product_crud_demo/feature/domain/usecases/get_products_uc.dart';
import 'package:product_crud_demo/feature/presentation/bloc/product_list_bloc/product_list_bloc.dart';

GetIt sl = GetIt.instance;

Future init() async {
/*  Get.lazyPut(() => GetProductsUseCase());
  Get.lazyPut(() => CreateProductUseCase());
  Get.lazyPut(() => LocalRepositoryImpl());
  Get.lazyPut(() => LocalDataSourceImpl());*/

  sl.registerFactory<LocalRepository>(() => LocalRepositoryImpl(sl.call()));
  sl.registerFactory<GetProductsUseCase>(() => GetProductsUseCase(sl.call()));
  sl.registerFactory<CreateProductUseCase>(
      () => CreateProductUseCase(sl.call()));
  sl.registerFactory<LocalRepositoryImpl>(() => LocalRepositoryImpl(sl.call()));
  sl.registerFactory<LocalDataSource>(() => LocalDataSourceImpl());

  sl.registerFactory<ProductListBloc>(() => ProductListBloc(sl.call()));
}
