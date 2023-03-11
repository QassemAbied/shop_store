import 'package:e_commerce/domain/use_case/allcategories_usecase.dart';

class ConstanceApi{
  static const String Product ='https://fakestoreapi.com/products';
  static const String Categories ='https://fakestoreapi.com/products/categories';
  static  String AllCategories( AllCategoryParameter Category) =>'https://fakestoreapi.com/products/category/$Category';
  static const String Limitresults ='https://fakestoreapi.com/products?limit=5';
  static String SingleProduct(int id) => 'https://fakestoreapi.com/products/$id';
  static const String Cart = 'https://fakestoreapi.com/carts';
  static  String deletCart(int idid) => 'https://fakestoreapi.com/carts/$idid';
  static  String AddCart(int idude) => 'https://fakestoreapi.com/carts/$idude';

}