import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/domain/entites/cart_entites.dart';
import 'package:e_commerce/domain/use_case/base_use_case.dart';
import 'package:equatable/equatable.dart';
import '../repositry_domain/base_repositry.dart';

class AlldeletCartUseCase extends BaseUseCase<CartEntites, AlldeletCartParameter>{
  final BaseRepositry baseRepositry;
  AlldeletCartUseCase(this.baseRepositry);
  @override
  Future<Either<Failure, CartEntites>> call(AlldeletCartParameter parametere)async {
    return await baseRepositry.getdeletCart(parametere);
  }

}
class AlldeletCartParameter extends Equatable{
  final int id;
  AlldeletCartParameter(this.id);

  @override
  List<Object?> get props => [id];
}