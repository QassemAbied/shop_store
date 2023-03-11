import 'package:e_commerce/domain/entites/product_entites.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier{
  List SelectedProduct =[];

  double pprice = 0;
  add(ProductEntites product)
  {
    SelectedProduct.add(product);
    pprice += product.price!.ceil();
    notifyListeners();
  }
  remove (ProductEntites product){
    SelectedProduct.remove(product);
    pprice -= product.price!.ceil();
    notifyListeners();
  }
}
// value.add(ProductEntites(
//     id: item.id,
//     title: item.title,
//     image: item.image,
//     category: item.category,
//     description: item.description,
//     price: item.price,
//     rating: item.rating
// ));






























//
// ListView.separated(
// physics: BouncingScrollPhysics(),
// shrinkWrap: true,
// scrollDirection: Axis.vertical,
// separatorBuilder: (context, index) {
// return SizedBox(
// height: 5,
// );
// },
// itemCount: state.cartdelet!.products.length,
// itemBuilder: (context, index) {
//
// final value = state.product[index];
// final int id = value.id;
//
// // if (item.products == value.id) {
// return Container(
// width: double.infinity,
// height: 130,
// child: Row(
// //mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Container(
// width: 120,
// height: 120,
// decoration: BoxDecoration(
// border: Border.all(
// width: 1,
// color: Colors.black)),
// child: CachedNetworkImage(
// imageUrl: '${value.image}',
// // fit: BoxFit.fill,
// height: 90.0,
// width: 90.0,
// placeholder: (context,
// child) {
// return Center(
// child:
// CircularProgressIndicator());
// },
// ),
// ),
// SizedBox(
// width: 10,
// ),
// Expanded(
// child: Column(
// children: [
// Text(
// '${value.title}',
// maxLines: 2,
// overflow:
// TextOverflow.ellipsis,
// style: TextStyle(
// fontSize: 15,
// fontWeight: FontWeight
//     .w600,
// ),
// ),
// SizedBox(
// height: 8,
// ),
// Row(
// children: [
// Align(
// alignment:
// Alignment.topLeft,
// child: Text(
// '\$  ${value.price}',
// maxLines: 2,
// overflow: TextOverflow
//     .ellipsis,
// style: TextStyle(
// color:
// Colors.green),
// ),
// ),
// Spacer(),
// IconButton(
// onPressed: () {
// BlocProvider.of<ProductBloc>(context).add(CartAddItem(id: value.id));
// },
// icon: Icon(
// Icons.close),
// ),
// ],
// ),
// SizedBox(
// height: 8,
// ),
// // Row(
// //   children: [
// //     Wrap(
// //       children: List
// //           .generate(5,
// //               (index) {
// //             return Icon(
// //               Icons.star,
// //               color: index <
// //                   SelectStar!
// //                   ? Colors
// //                   .amber
// //                   : Colors
// //                   .black54,
// //             );
// //           }),
// //     ),
// //     Text(
// //       ' ${SelectStar}',
// //       maxLines: 1,
// //       overflow:
// //       TextOverflow.ellipsis,
// //       style: TextStyle(
// //         fontWeight:
// //         FontWeight.w500,
// //         fontSize: 17,
// //         color: Colors.black,
// //       ),
// //     ),
// //   ],
// // )
// ],
// ),
// ),
// ],
// ),
// );
// // } else {
// //   return Container(
// //     child: Center(child: Text('qassemabied')),
// //   );
// // }
// }),
