import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/presentation/controller/product_bloc/bloc.dart';
import 'package:e_commerce/presentation/controller/product_bloc/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LimitProduct extends StatefulWidget {
  const LimitProduct({Key? key}) : super(key: key);

  @override
  State<LimitProduct> createState() => _LimitProductState();
}

class _LimitProductState extends State<LimitProduct> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductStates>(
      builder: (context, state) {

        return Container(
          margin: const EdgeInsets.only(left: 10, right: 5),
          width: double.infinity,
          height: 170,
          //color: Colors.black54,

          child: CarouselSlider.builder(
              itemCount: state.limitproduct.length,
              itemBuilder: (context, index, realIndex) {
                final item = state.limitproduct[index];
                final Startcolor = item.rating!.rate;
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 170,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),),
                          color: Colors.black54),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 170,
                          height: 170,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              color: Colors.white),
                          child: CachedNetworkImage(
                            imageUrl: '${item.image}',
                           //fit: BoxFit.fill,
                            height: 140.0,
                            width: 160.0,
                            placeholder: (context, child) {
                              return Center(child: const CircularProgressIndicator());
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text('${item.title}',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:  const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(' \$ ${item.price}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:  const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Wrap(
                                      children:List.generate(5, (index) {
                                        return Icon(Icons.star,
                                          color:index<Startcolor!  ? Colors.amber : Colors.black54,);
                                      }),
                                    ),
                                    Text(' ${item.rating?.rate}',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:  const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                initialPage: 0,
                autoPlay: true,
                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                autoPlayAnimationDuration: Duration(seconds: 4),
                enableInfiniteScroll: false,
                autoPlayInterval: const Duration(seconds: 4),

              )),
        );
      },
    );
  }
}


