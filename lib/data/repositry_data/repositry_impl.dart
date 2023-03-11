import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/core/error/servier_excaotion.dart';
import 'package:e_commerce/data/data_source/remote_data_source.dart';
import 'package:e_commerce/data/models/cart_models.dart';
import 'package:e_commerce/domain/entites/cart_entites.dart';
import 'package:e_commerce/domain/entites/categories.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/domain/repositry_domain/base_repositry.dart';
import 'package:e_commerce/domain/use_case/addcart_usecase.dart';
import 'package:e_commerce/domain/use_case/allcategories_usecase.dart';
import 'package:e_commerce/domain/use_case/deletcart_usecase.dart';
import 'package:e_commerce/domain/use_case/singleproduct_usecase.dart';

class RepositryImpl implements BaseRepositry{
  final RemoteDataSource remoteDataSource;
  RepositryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<ProductEntites>>> getProduct()async{
    final result = await remoteDataSource.getProduct();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<CategoriesEntites>>> getCategories()async {
    final result = await remoteDataSource.getCategories();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntites>>> getAllCategories(AllCategoryParameter parameter) async{
    final result = await remoteDataSource.getAllCategories(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntites>>> getLimitProduct()async {
    final result = await remoteDataSource.getLimitProduct();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ProductEntites>> getSingleProduct(SingleProduct parameter)async {
    final result = await remoteDataSource.getSingleProduct(parameter);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<CartModels>>> getallCart()async {
    final result = await remoteDataSource.getallCart();
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CartModels>> getdeletCart(AlldeletCartParameter parametere)async {
    final result = await remoteDataSource.getdeletallCart(parametere);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CartEntites>> getAddCart(AllAddCartParameter parametere) async{
    final result = await remoteDataSource.getAddCart(parametere);
    try{
      return Right(result);
    } on ServierException catch(failure){
      return Left(ServiceFailure(failure.errorHandle.statusMessage));
    }
  }

}