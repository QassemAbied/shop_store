import 'package:equatable/equatable.dart';

class ProductEntites  extends Equatable{
   final int id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  ProductEntites( {required this.id , required this.title,
    required this.image , required this.category,
  required this.description , required this.price , required this.rating});

  @override
  List<Object?> get props => [image, id , title , category , description , price , rating];
}

class Rating extends Equatable{
  double? rate;
  int? count;

  Rating({required this.rate,required this.count});



  @override
  List<Object?> get props => [rate , count];
}