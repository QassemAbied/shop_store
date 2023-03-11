// // import 'package:bloc/bloc.dart';
// // import 'package:e_commerce/domain/entites/cart_entites.dart';
// // import 'package:e_commerce/domain/entites/product_entites.dart';
// // import 'package:e_commerce/domain/use_case/base_use_case.dart';
// // import 'package:e_commerce/domain/use_case/cart_usecase.dart';
// // import 'package:e_commerce/presentation/controller/cart/cart_event.dart';
// // import 'package:e_commerce/presentation/controller/cart/cart_state.dart';
// //
// // import '../../../core/enum.dart';
// //
// // class CartBloc extends Bloc<CartEvent , CartState>{
// //   final AllallCartUseCase allallCartUseCase;
// //   CartBloc(this.allallCartUseCase) : super(CartState()){
// //     on<CartAddItem>((event, emit) async
// //     {
// //       final result = await allallCartUseCase.call(NoParameter());
// //
// //       result.fold((l) {
// //         return  emit(
// //
// //           state.copyWith(enumRequestcart: EnumRequest.error , messagecart:l.toString()),
// //         );
// //       }, (r) {
// //         return   emit(
// //           state.copyWith(cart: r..add(event.cartEntites), enumRequestcart:  EnumRequest.loded),
// //
// //         );
// //       });
// //
// //     });
// //   }
// //
// //
// //
// //
// //
// //
//
//
//
//
//
//
//
//
// //@override
// //   Stream<CartEvent> mapEventToState(
// //       CartEvent event)async*{
// //   if(event is CartStarted)
// //   {
// //     yield* _mapCartStartedToState();
// //   }else if (event is CartAddItem){
// //     yield* _mapCartAddingToState( event , state);
// //   }else if (event is CartremoveItem){
// //   yield* _mapCartremovedToState( event , state);
// //   }
// // }
//
// //}
//
// import 'package:bloc/bloc.dart';
//
// import '../../../domain/entites/cart_entites.dart';
// import '../../../domain/entites/product_entites.dart';
// import '../../../domain/use_case/addcart_usecase.dart';
// import '../../../domain/use_case/deletcart_usecase.dart';
// import 'cart_event.dart';
// import 'cart_state.dart';
//
// class CartBloc extends Bloc<CartEvent, CartState> {
//   final AlldeletCartUseCase alldeletCartUseCase;
//   final AllAddCartUseCase addCartUseCase;
//
//   CartBloc(this.alldeletCartUseCase, this.addCartUseCase) : super( ProductAdded(cartitem: [])){
//     //
//     // on<AddProduct>((event, emit)async{
//     //   final result =await alldeletCartUseCase.call(AlldeletCartParameter(event.id));
//     //
//     //   _cartItems.add(result);
//     //   emit(ProductAdded(cartitem: _cartItems));
//     // });
//
//
//     on<RemoveProduct>((event, emit) async{
//       final result =await addCartUseCase.call(AllAddCartParameter(event.productIndex));
//       _cartItems.remove(result);
//       emit(ProductRemoved(cartItem: _cartItems));
//     });
//
//
//
//
//   }
//   final List<CartEntites> _cartItems = [];
//   List<CartEntites> get items => _cartItems;
//
// }


import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/use_case/addcart_usecase.dart';
import 'package:e_commerce/domain/use_case/deletcart_usecase.dart';

import '../../../domain/entites/cart_entites.dart';
import '../../../domain/entites/product_entites.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AlldeletCartUseCase alldeletCartUseCase;
  final AllAddCartUseCase addCartUseCase;
  CartBloc(this.alldeletCartUseCase,
      this.addCartUseCase
      ) : super(ProductAdded(cartItem: []));

  final List<CartEntites> _cartItems = [];
  List<CartEntites> get items => _cartItems;
  bool isGridView = true;

  @override
  Stream<CartState> mapEventToState(CartEvent event) async* {
    if (event is AddProduct) {
      final result = alldeletCartUseCase.call(AlldeletCartParameter(event.id));
      if(result != null){
        _cartItems.add(event.productIndex);

      }
      yield ProductAdded(cartItem: _cartItems);
    } else if (event is RemoveProduct) {
     // final result = addCartUseCase.call(AllAddCartParameter(event.productIndex));

      _cartItems.remove(addCartUseCase.call(AllAddCartParameter(event.productIndex)));
      yield ProductRemoved(cartItem: _cartItems);
    }
    // else if (event is ChangeGallaryView) {
    //   isGridView = event.isGridView;
    //   yield ChangeGallaryViewState(isGridView: isGridView);
    // }
  }
}