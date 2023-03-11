import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entites/cart_entites.dart';
import 'package:e_commerce/domain/repositry_domain/base_repositry.dart';
import 'package:e_commerce/domain/use_case/base_use_case.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failure.dart';



class AllAddCartUseCase extends BaseUseCase<CartEntites, AllAddCartParameter>{
  final BaseRepositry baseRepositry;
  AllAddCartUseCase(this.baseRepositry);
  @override
  Future<Either<Failure, CartEntites>> call(AllAddCartParameter parametere)async {
    return await baseRepositry.getAddCart(parametere);
  }

}
class AllAddCartParameter extends Equatable{
  final int id;
  AllAddCartParameter(this.id);

  @override
  List<Object?> get props => [id];
}