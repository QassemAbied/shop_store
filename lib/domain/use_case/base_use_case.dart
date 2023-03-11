import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../core/error/failure.dart';

 abstract class BaseUseCase <T , Parametere>{
  Future<Either<Failure , T>> call(Parametere parametere);
}

class NoParameter extends Equatable{
  const NoParameter();

  @override
  List<Object?> get props => [];
}