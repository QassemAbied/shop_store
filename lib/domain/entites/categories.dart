import 'package:equatable/equatable.dart';

class CategoriesEntites extends Equatable{
 List<String>?  category;
 CategoriesEntites({required this.category});

  @override
  List<Object?> get props =>[ category];
}