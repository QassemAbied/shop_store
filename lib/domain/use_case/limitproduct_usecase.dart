import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/domain/use_case/base_use_case.dart';

import '../repositry_domain/base_repositry.dart';

class LimitProductUseCase extends BaseUseCase<List<ProductEntites> , NoParameter>{
  final BaseRepositry baseRepositry;
  LimitProductUseCase(this.baseRepositry);
  @override
  Future<Either<Failure, List<ProductEntites>>> call(NoParameter parametere)async {
    return await baseRepositry.getLimitProduct();
  }

}