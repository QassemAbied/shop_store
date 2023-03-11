import 'package:e_commerce/data/data_source/remote_data_source.dart';
import 'package:e_commerce/data/repositry_data/repositry_impl.dart';
import 'package:e_commerce/domain/repositry_domain/base_repositry.dart';
import 'package:e_commerce/domain/use_case/addcart_usecase.dart';
import 'package:e_commerce/domain/use_case/allcategories_usecase.dart';
import 'package:e_commerce/domain/use_case/cart_usecase.dart';
import 'package:e_commerce/domain/use_case/categories_usecase.dart';
import 'package:e_commerce/domain/use_case/deletcart_usecase.dart';
import 'package:e_commerce/domain/use_case/limitproduct_usecase.dart';
import 'package:e_commerce/domain/use_case/product_usecase.dart';
import 'package:e_commerce/domain/use_case/singleproduct_usecase.dart';
import 'package:e_commerce/presentation/controller/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/controller/cuibt/cubit.dart';
import 'package:e_commerce/presentation/controller/product_bloc/bloc.dart';
import 'package:get_it/get_it.dart';



final instance = GetIt.instance;

class ServiceLocator{
  void init() {
    instance.registerLazySingleton<RemoteDataSource>(() =>
        RemoteDataSourceImpl());
    instance.registerLazySingleton<BaseRepositry>(() =>
        RepositryImpl(instance()));
    instance.registerLazySingleton<ProductUseCase>(() =>
        ProductUseCase(instance()));
    instance.registerLazySingleton<CategoriesUseCase>(() =>
        CategoriesUseCase(instance()));
    instance.registerLazySingleton<AllCategoriesUseCase>(() =>
        AllCategoriesUseCase(instance()));
    instance.registerLazySingleton<LimitProductUseCase>(() =>
        LimitProductUseCase(instance()));
    instance.registerLazySingleton<SingleProductUseCase>(() =>
        SingleProductUseCase(instance()));
    instance.registerLazySingleton<AlldeletCartUseCase>(() =>
        AlldeletCartUseCase(instance()));
    instance.registerLazySingleton<AllallCartUseCase>(() =>
        AllallCartUseCase(instance()));
     instance.registerLazySingleton<AllAddCartUseCase>(() => AllAddCartUseCase(instance()));



    instance.registerFactory(() =>
        ProductBloc(instance(), instance(), instance(), instance(), instance(),
            instance(), instance(), instance() ));
    instance.registerFactory(() => HomeCuibt());
     instance.registerFactory(() => CartBloc(instance(), instance()));
  }
}