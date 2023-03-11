import 'package:e_commerce/domain/entites/categories.dart';

class CategoriesModel extends CategoriesEntites{
  CategoriesModel({required List<String>? category}) : super(category: category);

  factory CategoriesModel.fromJson(Map<String , dynamic>json)=>
      CategoriesModel(
          category: List.from(json['category']),
      );


}