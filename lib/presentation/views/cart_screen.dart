import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/presentation/controller/product_bloc/event.dart';
import 'package:e_commerce/presentation/controller/product_bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../core/di.dart';
import '../controller/product_bloc/bloc.dart';
import '../controller/provider/cart_provider.dart';
import 'details_screen.dart';

class CartScreen extends StatefulWidget {
  CartScreen({Key? key, }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final String category;
  late final int rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
                child: MultiBlocProvider(
                    providers: [
                  BlocProvider(
                      create: (BuildContext context) => instance<ProductBloc>()
                        ..add(getProductEvent())
                        ..add(CartAlltem())),
                ],
                    child: BlocBuilder<ProductBloc, ProductStates>(
                        builder: (context, state) {
                      return Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Consumer<Cart>(
                            builder: (context, value, child) {
                              return Column(children: [
                                ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 5,
                                        child: Divider(height: 1,thickness: 1, color: Colors.black,),
                                      );
                                    },

                                    itemCount: value.SelectedProduct.length,
                                    itemBuilder: (context, index) {
                                      final item = value.SelectedProduct[index];
                                      final SelectStar = item.rating?.rate;
                                      return Container(
                                        width: double.infinity,
                                        height: 130,
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        DetailsScreen(id: item.id)));
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 120,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.black)),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      '${item != null ? item.image : ''}',
                                                  height: 90.0,
                                                  width: 90.0,
                                                  placeholder: (context, child) {
                                                    return const Center(
                                                        child:
                                                            CircularProgressIndicator());
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '${item != null ? item.title : ''}',
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            '\$  ${item != null ? item.price : ''}',
                                                            maxLines: 2,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: const TextStyle(
                                                                color:
                                                                    Colors.green),
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        IconButton(
                                                          onPressed: () {
                                                            return value.remove(
                                                                ProductEntites(
                                                                    id: item.id,
                                                                    title: item
                                                                        .title,
                                                                    image: item
                                                                        .image,
                                                                    category: item
                                                                        .category,
                                                                    description: item
                                                                        .description,
                                                                    price: item
                                                                        .price,
                                                                    rating: item
                                                                        .rating));
                                                          },
                                                          icon: const Icon(Icons.close),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Wrap(
                                                          children: List.generate(
                                                              5, (index) {
                                                            return Icon(
                                                              Icons.star,
                                                              color: index <
                                                                      SelectStar!
                                                                  ? Colors.amber
                                                                  : Colors
                                                                      .black54,
                                                            );
                                                          }),
                                                        ),
                                                        Text(
                                                          ' ${SelectStar}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 17,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                              ]);
                            },
                          ));
                    })))));
  }
}
