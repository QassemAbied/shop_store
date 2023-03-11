import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/domain/entites/cart_entites.dart';
import 'package:e_commerce/domain/repositry_domain/base_repositry.dart';
import 'base_use_case.dart';

class AllallCartUseCase extends BaseUseCase<List<CartEntites>, NoParameter>{
  final BaseRepositry baseRepositry;
  AllallCartUseCase(this.baseRepositry);
  @override
  Future<Either<Failure, List<CartEntites>>> call( parametere)async {
    return await baseRepositry.getallCart();
  }

}
