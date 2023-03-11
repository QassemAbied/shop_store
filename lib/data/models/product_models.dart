import 'package:e_commerce/domain/entites/product_entites.dart';


class ProductModels extends ProductEntites{
  ProductModels({required int id, required String? title, required String? image,
    required String? category, required String? description, required double? price,
    required Rating? rating}) : super(id: id, title: title, image: image, category: category,
      description: description, price: price, rating: rating);

  factory ProductModels.fromJson(Map<String , dynamic> json)=>
      ProductModels(
        id:json ['id'],
        title: json['title'],
        image: json['image'],
        category: json['category'],
        description: json['description'],
        price: json['price'].toDouble(),

        rating :
        json['rating']!= null? RatingModels.fromJson(json['rating']): null ,
      );


}

class RatingModels extends Rating {
  RatingModels({required double? rate, required int? count}) : super(rate: rate, count: count);

  factory RatingModels.fromJson(Map<String , dynamic>json)=>
      RatingModels(
          rate: json['rate'].toDouble(),
          count: json['count'],
      );

}