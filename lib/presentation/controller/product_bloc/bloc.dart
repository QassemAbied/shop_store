//import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/enum.dart';
import 'package:e_commerce/data/models/categories_models.dart';
import 'package:e_commerce/domain/entites/cart_entites.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/domain/use_case/addcart_usecase.dart';
import 'package:e_commerce/domain/use_case/allcategories_usecase.dart';
import 'package:e_commerce/domain/use_case/base_use_case.dart';
import 'package:e_commerce/domain/use_case/cart_usecase.dart';
import 'package:e_commerce/domain/use_case/categories_usecase.dart';
import 'package:e_commerce/domain/use_case/deletcart_usecase.dart';
import 'package:e_commerce/domain/use_case/limitproduct_usecase.dart';
import 'package:e_commerce/domain/use_case/product_usecase.dart';
import 'package:e_commerce/presentation/controller/product_bloc/event.dart';
import 'package:e_commerce/presentation/controller/product_bloc/states.dart';
import 'package:flutter/material.dart';

import '../../../domain/use_case/singleproduct_usecase.dart';

class ProductBloc extends Bloc<ProductEvent , ProductStates>{
 final ProductUseCase productUseCase;
 final CategoriesUseCase categoriesUseCase;
 final AllCategoriesUseCase allCategoriesUseCase;
 final LimitProductUseCase limitProductUseCase;
 final AlldeletCartUseCase alldeletCartUseCase;
 final AllallCartUseCase allallCartUseCase;
 final AllAddCartUseCase addCartUseCase;
 final SingleProductUseCase singleProductUseCase;
 ProductBloc(this.productUseCase ,
      this.categoriesUseCase,
      this.allCategoriesUseCase,
      this.limitProductUseCase,
      this.alldeletCartUseCase,
     this.allallCartUseCase,
     this.addCartUseCase,
     this.singleProductUseCase
      ) : super(ProductStates()){

    on<getProductEvent>((event, emit) async{
      final ruslt = await productUseCase.call(NoParameter());
      ruslt.fold((l) {
        return  emit(

          state.Copywith(enumRequestproduct: EnumRequest.error , message:l.toString()),
        );
      },
              (r) {
             return   emit(
                    state.Copywith(product: r , enumRequestproduct:  EnumRequest.loded)
                );
              }
      );

    });





    on<getCategoryEvent>((event, emit) async{
      final ruslt = await categoriesUseCase.call(NoParameter());
      ruslt.fold((l) {
        return  emit(

          state.Copywith(enumRequestcategory: EnumRequest.error , messagecategory:l.toString()),
        );
      },
              (r) {
            return   emit(
                state.Copywith(category: r , enumRequestcategory:  EnumRequest.loded)
            );
          }
      );
    });




    on<getAllCategoryEvent>((event, emit) async{
      final ruslt = await allCategoriesUseCase.call(AllCategoryParameter(event.Category));
      ruslt.fold((l) {
        return  emit(

          state.Copywith(enumRequestallcategory: EnumRequest.error , messageallcategory:l.toString()),
        );
      },
              (r) {
            return   emit(
                state.Copywith(allcategory: r , enumRequestallcategory:  EnumRequest.loded)
            );
          }
      );
    });



    on<getLimitProductEvent>((event, emit) async{
      final ruslt = await limitProductUseCase.call(NoParameter());
      ruslt.fold((l) {
        return  emit(

          state.Copywith(enumRequestlimitproduct: EnumRequest.error , messagelimitproduct:l.toString()),
        );
      },
              (r) {
            return   emit(

                state.Copywith(limitproduct: r, enumRequestlimitproduct:  EnumRequest.loded),

            );

          }
      );

    });
    on<CartAlltem>((event, emit)async {
      final result = await allallCartUseCase.call(NoParameter());
      result.fold((l) {
        emit(state.Copywith(enumRequestcart: EnumRequest.error , messagecart: l.toString()));
      }, (r) {
        emit(
          state.Copywith(cart: r , enumRequestcart: EnumRequest.loded)
        );
      });

    });

    on<getSingleProductEvent>((event, emit)async {
      final result = await singleProductUseCase.call(SingleProduct(event.id));
      result.fold((l) {
        emit( state.Copywith(enumRequest: EnumRequest.loding , messagep: l.toString()));
      }, (r) {
        emit( state.Copywith(singleProduct : r ,enumRequest: EnumRequest.loding ,));
      });
    });

    on<CartdeletItem>((event, emit) async{

      final result = await alldeletCartUseCase.call(AlldeletCartParameter(event.id));
      print(state.cartdelet);

      result.fold((l) {
        return  emit(

          state.Copywith(enumRequestcartdelet: EnumRequest.error , messagecartdelet:l.toString()),
        );
      },
              (r) {
            return   emit(
              state.Copywith(cartdelet: r..products.add(event.listProductModel) , enumRequestcartdelet:  EnumRequest.loded),

            );

          }

      );

    });


    on<CartAddItem>((event, emit) async{

      final result = await addCartUseCase.call(AllAddCartParameter(event.id));

      print(state.cartdelet);
      result.fold((l) {
        return  emit(

          state.Copywith(enumRequestcartadd: EnumRequest.error , messagecartadd:l.toString()),
        );
      },
              (r) {
            return   emit(
              state.Copywith(cartadd: r , enumRequestcartadd:  EnumRequest.loded),

            );

          }

      );

    });



 }
}




























//
// class MoviesBloc extends Bloc<MoviesEvent , MoviesState>{
//   final UpComingUseCase upComingUseCase;
//   final getPlayingNowUseCase playingNowUseCase;
//   final getTopRated topRated;
//   MoviesBloc(this.upComingUseCase, this.playingNowUseCase, this.topRated) : super( MoviesState()){
//     on<getUpComingEvent>((event, emit)async {
//       final result = await upComingUseCase.call(NoParameters());
//       // print(result);
//       result.fold((l) {
//         emit(
//
//           state.copyWith(upcomingrequest: EunmRequest.error , upcomingmessage: l.message),
//         );
//       }, (r) {
//         emit(
//             state.copyWith(upcoming: r , upcomingrequest:  EunmRequest.loded)
//         );
//       }
//       );
//     });
//
//
//
//
//
//
//


