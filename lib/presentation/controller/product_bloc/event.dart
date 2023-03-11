import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/cart_models.dart';
import '../../../domain/entites/cart_entites.dart';

abstract class ProductEvent extends Equatable{
   ProductEvent();

  @override
  List<Object> get props =>[];
}
class getProductEvent extends ProductEvent{}
class getCategoryEvent extends ProductEvent{}

class getAllCategoryEvent extends ProductEvent{
  final String Category;
  getAllCategoryEvent({required this.Category});
}

class getLimitProductEvent extends ProductEvent{}

class getdeletCartEvent extends ProductEvent{
 final int id;
  final CartModels cartEntites;
  getdeletCartEvent({required this.id,required this.cartEntites});
  @override
  List<Object> get props =>[id ,  cartEntites];
}
class CartAlltem extends ProductEvent{

}
class getSingleProductEvent extends ProductEvent{
  final int id ;
  getSingleProductEvent(this.id);
  List<Object> get props =>[id ];
}
class CartdeletItem extends ProductEvent{
  final int id;
  final ListProduct listProductModel;
  CartdeletItem( this.id,this.listProductModel );
  @override
  List<Object> get props =>[id , listProductModel];


}
class CartAddItem extends ProductEvent{
  final int id;
  CartAddItem({required this.id,});

  @override
  List<Object> get props =>[id,  ];

}