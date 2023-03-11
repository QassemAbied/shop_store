import 'package:equatable/equatable.dart';

class CartEntites extends Equatable{
  final int id;
  final int userId;
  final String data;
  final List<ListProduct> products;


  CartEntites({required this.id , required this.data , required this.userId ,
   required this.products
  });

  @override
  List<Object> get props => [id , data , userId , products];

}

class ListProduct extends Equatable {
  int? productId;
  int? quantity;

  ListProduct({required this.productId, required this.quantity});

  @override
  List<Object?> get props => [productId, quantity];
}