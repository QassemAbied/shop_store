import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Failure extends Equatable{
  final StreamBuilder message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceFailure extends Failure{
  ServiceFailure(StreamBuilder message) : super(message);

}