import 'package:equatable/equatable.dart';

class ErrorHandleApi extends Equatable{
   dynamic statusMessage ;

   ErrorHandleApi({required this.statusMessage , });

  factory ErrorHandleApi.fromJson(Map<String , dynamic> json)=>
      ErrorHandleApi(
          statusMessage: json['statusMessage'],

      );

  @override
  List<Object?> get props => [statusMessage];
}