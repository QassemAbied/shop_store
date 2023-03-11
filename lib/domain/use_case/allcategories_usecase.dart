import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/domain/use_case/base_use_case.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failure.dart';
import '../repositry_domain/base_repositry.dart';

class AllCategoriesUseCase extends BaseUseCase<List<ProductEntites> , AllCategoryParameter>{
  final BaseRepositry baseRepositry;
  AllCategoriesUseCase(this.baseRepositry);
  @override
  Future<Either<Failure, List<ProductEntites>>> call(AllCategoryParameter parametere)async {
    return await baseRepositry.getAllCategories(parametere);
  }

}

class AllCategoryParameter extends Equatable{
  final String Category;
  AllCategoryParameter(this.Category);

  @override
  List<Object?> get props => [Category];
}