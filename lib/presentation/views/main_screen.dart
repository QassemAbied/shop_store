import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce/core/di.dart';
import 'package:e_commerce/presentation/controller/cuibt/cubit.dart';
import 'package:e_commerce/presentation/controller/cuibt/states.dart';
import 'package:e_commerce/presentation/views/cart_screen.dart';
import 'package:e_commerce/presentation/views/home_screen.dart';
import 'package:e_commerce/presentation/views/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../controller/provider/cart_provider.dart';

class MainScreen extends StatelessWidget {
  List<Widget> Screens =[

    HomeScreen(),
    CartScreen(),
    Settings(),
  ];
  List<String> appbar =
  [
    'Home',
    'MyCart',

  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>instance<HomeCuibt>(),
      child: BlocBuilder<HomeCuibt ,HomeStates>(
        builder: (context , state)
        {
          return  Scaffold(

            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              title: Text('${appbar[ HomeCuibt.get(context).CurrentIndex]}',style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ), ),
              actions: [
                Consumer<Cart>(
                  builder: (context , value , child)
                  {
                    return  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
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
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            body:Screens[ HomeCuibt.get(context).CurrentIndex] ,
            bottomNavigationBar: CurvedNavigationBar(
              height: 45.0,
              backgroundColor: Colors.teal,
              onTap: (index){
                HomeCuibt.get(context).ChangeNaviIndex(index);
              },
              items: const [
                Icon(Icons.home),
                Icon(Icons.add_shopping_cart_outlined),

              ],
            ),
          );
        },
      ),
    );
  }
}
