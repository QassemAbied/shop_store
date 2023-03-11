import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/categories.dart';
import 'package:e_commerce/domain/repositry_domain/base_repositry.dart';
import 'package:e_commerce/domain/use_case/base_use_case.dart';
import '../../core/error/failure.dart';

class CategoriesUseCase extends BaseUseCase<List<CategoriesEntites> , NoParameter>{
  final BaseRepositry baseRepositry;
  CategoriesUseCase(this.baseRepositry);
  @override
  Future<Either<Failure, List<CategoriesEntites>>> call(NoParameter parametere)async {
    return await baseRepositry.getCategories();
  }

}