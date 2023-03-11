import 'package:e_commerce/domain/entites/cart_entites.dart';


class CartModels extends CartEntites {
  CartModels({required int id, required String data,
    required int userId, required List<ListProduct> products}) :
        super(id: id, data: data, userId: userId, products: products);

  factory CartModels.fromJson(Map<String , dynamic> json)=>
      CartModels(
        id: json['id'],
        userId: json['userId'],
        data: json['data'].toString(),
       products: List.from(json['products'].map((e) =>
       ListProductModel.fromJson(e) )),
      );


}

class ListProductModel extends ListProduct {
  ListProductModel({required int? productId, required int? quantity})
      : super(productId: productId, quantity: quantity);

  factory ListProductModel.fromJson(Map<String, dynamic> json)=>
      ListProductModel(
        productId: json['productId'],
        quantity: json['quantity'],
      );


}
