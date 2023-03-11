import 'package:bloc/bloc.dart';
import 'package:e_commerce/presentation/controller/cuibt/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeCuibt extends Cubit<HomeStates>{
  HomeCuibt() : super(InitialState());

  static HomeCuibt get(context)=> BlocProvider.of(context);

  int CurrentIndex =0;
  void ChangeNaviIndex( index)
  {
   CurrentIndex = index;
    emit(Changeindex());
  }
}