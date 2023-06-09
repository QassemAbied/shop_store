import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/di.dart';
import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:e_commerce/presentation/controller/product_bloc/bloc.dart';
import 'package:e_commerce/presentation/controller/product_bloc/event.dart';
import 'package:e_commerce/presentation/controller/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../controller/product_bloc/states.dart';

class DetailsScreen extends StatelessWidget {
  final int id;
  const DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
      instance<ProductBloc>()..add(getSingleProductEvent(id)),
      child: BlocBuilder<ProductBloc, ProductStates>(
        builder: (context, state) {
          final items = state.singleProduct;
          final ShowRating = items?.rating!.rate!.floorToDouble();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: const Text(
                'Details',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              actions: [
                Consumer<Cart>(
                  builder: (context , value , child)
                  {
                    return  Row(
                      children: [
                        Stack(
                          children: [
                            IconButton(
                              onPressed: (){
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context)=> CartScreen()),
                                // );
                              },
                              icon: const Icon(Icons.shopping_cart_outlined) ,
                              color: Colors.black,
                              iconSize: 30,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,

                                ),
                                child:  Center(
                                  child: Text('${value.SelectedProduct.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      //  fontSize: 20
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(' \$  ${value.pprice}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15
                          ),
                        ),
                      ],
                    );
                  },

                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: '${items != null ? items.image : ''}',
                    fit: BoxFit.fitHeight,
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    placeholder: (context, child) {
                      return const Center(child: CircularProgressIndicator());
                    },
                    errorWidget: (context, url, error) {
                      return const Image(
                        image: AssetImage('assets/1.jpg'),
                        fit: BoxFit.fitHeight,
                        // height:MediaQuery.of(context).size.height /2,
                        width: double.infinity,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${items != null ? items.title : ''}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        '${items != null ? items.category : ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 10,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: items != null
                                ? index < ShowRating!
                                ? Colors.amber
                                : Colors.black54
                                : null,
                          );
                        }),
                      ),
                      Text(
                        '${items != null ? items.rating?.rate : ''}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${items != null ? items.description : ''}',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' \$  ${items != null ? items.price : ''}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Consumer<Cart>(
                        builder: (context, value, child) {
                          return ElevatedButton(
                            style: const ButtonStyle(),
                            onPressed: () {
                              value.add(
                                ProductEntites(
                                    id: items!.id,
                                    title: items.title,
                                    image: items.image,
                                    category: items.category,
                                    description: items.description,
                                    price: items.price,
                                    rating: items.rating),
                              );
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Add to Cart',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
