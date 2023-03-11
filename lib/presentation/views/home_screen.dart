import 'package:e_commerce/presentation/component/allcategories_widget.dart';
import 'package:e_commerce/presentation/component/limit_product.dart';
import 'package:e_commerce/presentation/component/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di.dart';
import '../controller/product_bloc/bloc.dart';
import '../controller/product_bloc/event.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> instance<ProductBloc>()
        ..add(getProductEvent())
        ..add(getLimitProductEvent()),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: 700,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(

              children: [
                const SizedBox(
                  height: 10,
                ),
                const LimitProduct(),
                const SizedBox(
                  height: 10,
                ),
                const AllCategoriesWidget(),
                const SizedBox(
                  height: 10,
                ),
                ProductWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
