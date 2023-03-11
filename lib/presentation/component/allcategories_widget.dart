import 'package:e_commerce/presentation/controller/product_bloc/bloc.dart';
import 'package:e_commerce/presentation/controller/product_bloc/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCategoriesWidget extends StatefulWidget {
  final  String name;
  const AllCategoriesWidget({Key? key ,this.name = '' }) : super(key: key);

  @override
  State<AllCategoriesWidget> createState() => _AllCategoriesWidgetState();
}

class _AllCategoriesWidgetState extends State<AllCategoriesWidget> {
  List<String> Category=[
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing"
  ];
  late String name;
  @override
  void initState() {
    super.initState();
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:Category.length ,
        itemBuilder: (context , index){
          final item = Category[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      name = item;
                      context.read<ProductBloc>()..add(getAllCategoryEvent(Category: name));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                  width: 130,
                   height:30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: name=='${item}'?Colors.black : Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text('      ${item}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: name=='${item}'?Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  )),
            ],
          );
        },
      ),

    );
  }
}
