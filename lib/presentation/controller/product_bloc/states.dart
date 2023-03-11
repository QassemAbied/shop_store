import 'package:e_commerce/core/enum.dart';
import 'package:e_commerce/domain/entites/cart_entites.dart';
import 'package:e_commerce/domain/entites/categories.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart_models.dart';

class ProductStates extends Equatable{
  final List<ProductEntites> product;
  final EnumRequest enumRequestproduct;
  final String message;

  final List<CategoriesEntites> category;
  final EnumRequest enumRequestcategory;
  final String messagecategory;


  final List<ProductEntites> allcategory;
  final EnumRequest enumRequestallcategory;
  final String messageallcategory;

  final List<ProductEntites> limitproduct;
  final EnumRequest enumRequestlimitproduct;
  final String messagelimitproduct;


  final ProductEntites? singleProduct;
  final EnumRequest enumRequest;
  final String messagep;

  final List<CartEntites> cart;
  final EnumRequest enumRequestcart;
  final String messagecart;

  final CartEntites? cartdelet ;
  final EnumRequest enumRequestcartdelet;
  final String messagecartdelet;

  final CartEntites? cartadd;
  final EnumRequest enumRequestcartadd;
  final String messagecartadd;

  ProductStates({
    this.product= const[],
    this.enumRequestproduct= EnumRequest.loded,
    this.message ='',

    this.category=const [],
    this.enumRequestcategory = EnumRequest.loded,
    this.messagecategory = '',

    this.singleProduct,
    this.enumRequest = EnumRequest.loded,
    this.messagep = '',

    this.allcategory = const[],
    this.enumRequestallcategory= EnumRequest.loded,
    this.messageallcategory ='',

    this.limitproduct = const[],
    this.enumRequestlimitproduct= EnumRequest.loded,
    this.messagelimitproduct = '',



    this.cart = const[],
    this.enumRequestcart= EnumRequest.loded,
    this.messagecart = '',

     this.cartdelet  ,
    this.enumRequestcartdelet= EnumRequest.loded,
    this.messagecartdelet= '',


    this.cartadd,
    this.enumRequestcartadd= EnumRequest.loded,
    this.messagecartadd ='',
});

  ProductStates Copywith(
  {
    final List<ProductEntites>? product,
    final EnumRequest? enumRequestproduct,
    final String? message,

    final List<CategoriesEntites>? category,
    final EnumRequest? enumRequestcategory,
    final String? messagecategory,

    final ProductEntites? singleProduct,
    final EnumRequest? enumRequest,
    final String? messagep,

    final List<ProductEntites>? allcategory,
    final EnumRequest? enumRequestallcategory,
    final String? messageallcategory,

    final List<ProductEntites>? limitproduct,
    final EnumRequest? enumRequestlimitproduct,
    final String? messagelimitproduct,

    final List<CartEntites>? cart,
    final EnumRequest? enumRequestcart,
    final String? messagecart,

    final CartEntites? cartdelet,
    final EnumRequest? enumRequestcartdelet,
    final String? messagecartdelet,


    final CartEntites? cartadd,
    final EnumRequest? enumRequestcartadd,
    final String? messagecartadd,
}
      ){
    return ProductStates(
      product: product??this.product,
      enumRequestproduct: enumRequestproduct??this.enumRequestproduct,
      message: message??this.message,

      category: category??this.category,
      enumRequestcategory: enumRequestcategory??this.enumRequestcategory,
      messagecategory: messagecategory??this.messagecategory,


      allcategory: allcategory??this.allcategory,
      enumRequestallcategory: enumRequestallcategory??this.enumRequestallcategory,
      messageallcategory: messageallcategory??this.messageallcategory,

      limitproduct: limitproduct??this.limitproduct,
      enumRequestlimitproduct: enumRequestlimitproduct??this.enumRequestlimitproduct,
      messagelimitproduct: messagelimitproduct??this.messagelimitproduct,

      cart: cart??this.cart,
      enumRequestcart: enumRequestcart??this.enumRequestcart,
      messagecart: messagecart??this.messagecart,

      cartdelet: cartdelet??this.cartdelet,
      enumRequestcartdelet: enumRequestcartdelet??this.enumRequestcartdelet,
      messagecartdelet: messagecartdelet??this.messagecartdelet,

      cartadd: cartadd??this.cartadd,
      enumRequestcartadd: enumRequestcartadd??this.enumRequestcartadd,
      messagecartadd: messagecartadd??this.messagecartadd,

      singleProduct: singleProduct??this.singleProduct,
      enumRequest: enumRequest??this.enumRequest,
      messagep: messagep??this.messagep,
    );
  }

  @override
  List<Object?> get props => [
    product , enumRequestproduct , message,
    allcategory , enumRequestallcategory , messageallcategory,
    limitproduct , enumRequestlimitproduct , messagelimitproduct,
   cart , enumRequestcart , messagecart,
    cartdelet , enumRequestcartdelet , messagecartdelet,
    cartadd ,enumRequestcartadd,messagecartadd,
    singleProduct , enumRequest , message
  ];
}