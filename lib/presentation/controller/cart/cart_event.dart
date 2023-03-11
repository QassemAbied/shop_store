// // import 'package:e_commerce/domain/entites/cart_entites.dart';
// // import 'package:e_commerce/domain/entites/product_entites.dart';
// // import 'package:equatable/equatable.dart';
// //
// // abstract class CartEvent extends Equatable{
// //   @override
// //   List<Object?> get props => [];
// //
// // }
// //
// // class CartAddItem extends CartEvent{
// //   final CartEntites cartEntites;
// //   CartAddItem(this.cartEntites);
// //   @override
// //   List<Object?> get props => [cartEntites];
// // }
//
// // class CartAddItem extends CartEvent{
// //   final ProductEntites productEntites;
// //   CartAddItem(this.productEntites);
// //
// //   @override
// //   List<Object?> get props => [productEntites];
// // }
// //
// // class CartremoveItem extends CartEvent{
// //   final ProductEntites productEntites;
// //   CartremoveItem(this.productEntites);
// //
// //   @override
// //   List<Object?> get props => [productEntites];
// // }
//
//
//
//
//
//
// import 'package:equatable/equatable.dart';
//
// abstract class CartEvent extends Equatable {
//   const CartEvent();
//
//   @override
//   List<Object> get props => [];
// }
//
// class AddProduct extends CartEvent {
//   final int id;
//
//   const AddProduct(this.id);
//
//   @override
//   List<Object> get props => [id];
//
//   @override
//   String toString() => 'AddProduct { index: $id }';
// }
//
// class RemoveProduct extends CartEvent {
//   final int productIndex;
//
//   const RemoveProduct(this.productIndex);
//
//   @override
//   List<Object> get props => [productIndex];
//
//   @override
//   String toString() => 'RemoveProduct { index: $productIndex }';
// }


import 'package:equatable/equatable.dart';

import '../../../domain/entites/cart_entites.dart';
import '../../../domain/entites/product_entites.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddProduct extends CartEvent {
  final CartEntites productIndex;
  final int id;
  const AddProduct(this.productIndex , this.id);

  @override
  List<Object> get props => [productIndex, id];

  @override
  String toString() => 'AddProduct { index: $productIndex }';
}

class RemoveProduct extends CartEvent {
  final int productIndex;

  const RemoveProduct(this.productIndex);

  @override
  List<Object> get props => [productIndex];

  @override
  String toString() => 'RemoveProduct { index: $productIndex }';
}