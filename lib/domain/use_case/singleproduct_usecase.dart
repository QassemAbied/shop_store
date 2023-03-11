import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/domain/repositry_domain/base_repositry.dart';
import 'package:e_commerce/domain/use_case/base_use_case.dart';
import 'package:equatable/equatable.dart';

class SingleProductUseCase extends BaseUseCase<ProductEntites , SingleProduct>{
  final BaseRepositry baseRepositry;
  SingleProductUseCase(this.baseRepositry);
  @override
  Future<Either<Failure, ProductEntites>> call(SingleProduct parametere)async {
    return await baseRepositry.getSingleProduct(parametere);
  }

}

class SingleProduct extends Equatable{
  final int id;
  SingleProduct(this.id);

  @override
  List<Object?> get props => [];
}