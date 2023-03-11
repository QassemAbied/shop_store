import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/presentation/controller/cart/cart_bloc.dart';
import 'package:e_commerce/presentation/controller/product_bloc/bloc.dart';
import 'package:e_commerce/presentation/controller/product_bloc/event.dart';
import 'package:e_commerce/presentation/controller/provider/cart_provider.dart';
import 'package:e_commerce/presentation/views/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../controller/product_bloc/states.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (BuildContext context) =>
              instance<ProductBloc>()
                ..add(getProductEvent())),
          BlocProvider(create:  (BuildContext context) =>instance<CartBloc>())
        ],
      child: BlocBuilder<ProductBloc, ProductStates>(
        builder: (context, state)
    {
      return Column(
          children: [
            Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 590,
                    child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0.2,
                        crossAxisSpacing: 0.7,
                        childAspectRatio: 0.7,
                        children: List.generate(state.product.length, (index) {
                          final item = state.product[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailsScreen(id: item.id)));
                            },
                            child: Column(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: '${item.image}',
                                  fit: BoxFit.fill,
                                  height: 160.0,
                                  width: 120.0,
                                  placeholder: (context, child) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  },
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${item.title}',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$  ${item.price}',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.green),
                                          ),
                                          const Spacer(),
                                                Consumer<Cart>(
                                                  builder: (context , value, child){
                                                  return  IconButton(
                                                      onPressed: () {
                                                        return
                                                          value.add(ProductEntites(
                                                            id: item.id,
                                                            title: item.title,
                                                            image: item.image,
                                                            category: item.category,
                                                            description: item.description,
                                                            price: item.price,
                                                            rating: item.rating
                                                        ));
                                                      },
                                                      icon: const Icon(
                                                        Icons.shopping_cart_outlined,
                                                        color: Colors.black,
                                                      ),
                                                    );
                                                  },
                                                ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        )
                    ),

                  )
                ]
            )
          ]
      );
    }


   )
    );

  }}