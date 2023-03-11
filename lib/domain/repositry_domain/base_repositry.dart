import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/data/models/cart_models.dart';
import 'package:e_commerce/domain/entites/cart_entites.dart';
import 'package:e_commerce/domain/entites/categories.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/domain/use_case/addcart_usecase.dart';
import 'package:e_commerce/domain/use_case/cart_usecase.dart';
import 'package:e_commerce/domain/use_case/deletcart_usecase.dart';
import 'package:e_commerce/domain/use_case/singleproduct_usecase.dart';

import '../use_case/allcategories_usecase.dart';

abstract class BaseRepositry{
  Future<Either<Failure , List<ProductEntites>>> getProduct();
  Future<Either<Failure , List<CategoriesEntites>>> getCategories();
  Future<Either<Failure , List<ProductEntites>>> getAllCategories(AllCategoryParameter parametere);
  Future<Either<Failure , List<ProductEntites>>> getLimitProduct();
  Future<Either<Failure , ProductEntites>> getSingleProduct(SingleProduct parametere);
  Future<Either<Failure ,List<CartEntites>>> getallCart();
  Future<Either<Failure ,CartEntites>> getdeletCart(AlldeletCartParameter parametere);
  Future<Either<Failure ,CartEntites>> getAddCart(AllAddCartParameter parametere);


}