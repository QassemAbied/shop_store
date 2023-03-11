// // import 'package:e_commerce/core/enum.dart';
// // import 'package:e_commerce/domain/entites/cart_entites.dart';
// // import 'package:e_commerce/domain/entites/product_entites.dart';
// // import 'package:equatable/equatable.dart';
// //
// //  class CartState extends Equatable{
// //    final List<CartEntites> cart;
// //    final EnumRequest enumRequestcart;
// //    final String messagecart;
// //
// //    CartState({
// //      this.cart = const[],
// //      this.enumRequestcart = EnumRequest.loding,
// //      this.messagecart = '',
// //  });
// //    CartState copyWith({
// //      final List<CartEntites>? cart,
// //      final EnumRequest? enumRequestcart,
// //      final String? messagecart,
// //  }){
// //      return CartState(
// //        cart:  cart??this.cart,
// //        enumRequestcart: enumRequestcart??this.enumRequestcart,
// //        messagecart: messagecart??this.messagecart,
// //      );
// //    }
// //
// //    @override
// // List<Object?> get props => [cart , enumRequestcart , messagecart];
// // }
//
//
// import 'package:e_commerce/domain/entites/cart_entites.dart';
// import 'package:e_commerce/domain/entites/product_entites.dart';
//
// abstract class CartState {
//   final List<CartEntites> cartItem;
//   const CartState({required this.cartItem});
//
//   @override
//   List<Object> get props => [];
// }
//
// class CartLoadInProgress extends CartState {
//   CartLoadInProgress({required List<CartEntites> cartItem}) : super(cartItem: cartItem);
// }
//
// class ProductAdded extends CartState {
//
//   final List<CartEntites> cartitem;
//
//    ProductAdded({required this.cartitem, }) : super(cartItem: cartitem);
//
//   @override
//   List<Object> get props => [cartitem];
//
//   @override
//   String toString() => 'ProductAdded { todos: $cartitem }';
// }
//
// class ProductRemoved extends CartState {
//   final List<CartEntites> cartItem;
//
//    ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);
//
//   @override
//   List<Object> get props => [cartItem];
//
//   @override
//   String toString() => 'ProductRemoved { todos: $cartItem }';
// }


import 'package:e_commerce/domain/entites/product_entites.dart';

import '../../../domain/entites/cart_entites.dart';

abstract class CartState {
  final List<CartEntites> cartItem;
  final bool isGridView;
  const CartState({this.cartItem = const [], this.isGridView = true});

  @override
  List<Object> get props => [];
}

class CartLoadInProgress extends CartState {
  CartLoadInProgress();
}

class ProductAdded extends CartState {
  final List<CartEntites> cartItem;

  const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}

class ProductRemoved extends CartState {
  final List<CartEntites> cartItem;

  const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}