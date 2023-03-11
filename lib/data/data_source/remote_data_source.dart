import 'package:e_commerce/core/api.dart';
import 'package:e_commerce/core/error/error_handle.dart';
import 'package:e_commerce/core/error/servier_excaotion.dart';
import 'package:e_commerce/data/models/cart_models.dart';
import 'package:e_commerce/data/models/categories_models.dart';
import 'package:e_commerce/data/models/product_models.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce/domain/use_case/allcategories_usecase.dart';
import 'package:e_commerce/domain/use_case/deletcart_usecase.dart';
import 'package:e_commerce/domain/use_case/singleproduct_usecase.dart';

import '../../domain/use_case/addcart_usecase.dart';
abstract class RemoteDataSource{
  Future<List<ProductModels>> getProduct();
  Future<List<CategoriesModel>> getCategories();
  Future<List<ProductModels>> getAllCategories(AllCategoryParameter parameter);
  Future<List<ProductModels>> getLimitProduct();
  Future<ProductModels> getSingleProduct(SingleProduct parameter);
  Future<List<CartModels>> getallCart();
  Future<CartModels> getdeletallCart(AlldeletCartParameter parametere);
  Future<CartModels> getAddCart(AllAddCartParameter parametere);


}

class RemoteDataSourceImpl implements RemoteDataSource{
  @override
  Future<List<ProductModels>> getProduct()async{
   final response = await Dio().get(ConstanceApi.Product);
   if(response.statusCode ==200){
     return List<ProductModels>.from((response.data  as List).
     map((e) =>ProductModels.fromJson(e) )
     ).toList();
   }else{
    throw ServierException(ErrorHandleApi.fromJson(response.data));
   }
  }

  @override
  Future<List<CategoriesModel>> getCategories()async {
    final response = await Dio().get(ConstanceApi.Categories);
    if(response.statusCode ==200){
      return List<CategoriesModel>.from((response.data  as List).
      map((e) =>CategoriesModel.fromJson(e) )
      ).toList();
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModels>> getAllCategories(AllCategoryParameter parameter)async {
    final response = await Dio().get(ConstanceApi.AllCategories(AllCategoryParameter(parameter.Category)));
    if(response.statusCode ==200){
      return List<ProductModels>.from((response.data  as List).
      map((e) =>ProductModels.fromJson(e) )
      ).toList();
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<ProductModels>> getLimitProduct() async{
    final response = await Dio().get(ConstanceApi.Limitresults);
    if(response.statusCode ==200){
      return List<ProductModels>.from((response.data  as List).
      map((e) =>ProductModels.fromJson(e) )
      ).toList();
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<ProductModels> getSingleProduct(SingleProduct parameter)async {
    final response = await Dio().get(ConstanceApi.SingleProduct(parameter.id));
    if(response.statusCode ==200){
      return ProductModels.fromJson(response.data);
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<List<CartModels>> getallCart( ) async{
    final response = await Dio().get(ConstanceApi.Cart);
    if(response.statusCode ==200){
      return List<CartModels>.from((response.data  as List).
      map((e) =>CartModels.fromJson(e) )
      ).toList();
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<CartModels> getdeletallCart(AlldeletCartParameter parametere)async {
    final response = await Dio().get(ConstanceApi.deletCart(parametere.id));
    if(response.statusCode ==200){
      return CartModels.fromJson(response.data);
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

  @override
  Future<CartModels> getAddCart(AllAddCartParameter parametere) async{
    final response = await Dio().delete(ConstanceApi.AddCart(parametere.id));
    if(response.statusCode ==200){
      return CartModels.fromJson(response.data);
    }else{
      throw ServierException(ErrorHandleApi.fromJson(response.data));
    }
  }

}