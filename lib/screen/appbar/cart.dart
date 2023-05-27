// import 'package:Ecommerce/screen/product/model/product.dart';
// import 'package:Ecommerce/screen/product/detail_product.dart';
// import 'package:flutter/material.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   @override
//   void initState() {
//     super.initState();

//     cartItem = cartItem.toSet().toList();
//   }

//   late int totalAmount;

//   @override
//   Widget build(BuildContext context) {
//     totalAmount = 0;
//     cartItem.forEach((element) {
//       totalAmount += element.productPrize * element.selectedItem;
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Cart"),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(children: [
//           ...cartItem
//               .map<Widget>((e) => GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ProductDetailPage(
//                             product: e,
//                           ),
//                         ),
//                       );
//                     },
//                     child: Container(
//                         margin: EdgeInsets.all(5),
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey.withOpacity(0.5),
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(25),
//                           ),
//                         ),

//                         // height: 300,
//                         width: double.infinity,
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Container(
//                                     height: 200,
//                                     width: 175,
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.all(
//                                         Radius.circular(25),
//                                       ),
//                                     ),
//                                     child: Image.network(
//                                       e.productImage,
//                                       width: 200,
//                                       height: 200,
//                                       fit: BoxFit.fitHeight,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     "${e.productPrize} RS",
//                                     style: TextStyle(
//                                         fontSize: 22,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text("${e.productName}",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.w500),
//                                       textAlign: TextAlign.center),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Expanded(
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   TextButton(
//                                       onPressed: () {
//                                         showDialog(
//                                             context: context,
//                                             builder: (context) => Dialog(
//                                                   shape: RoundedRectangleBorder(
//                                                       borderRadius:
//                                                           BorderRadius.all(
//                                                               Radius.circular(
//                                                                   25))),
//                                                   clipBehavior: Clip.antiAlias,
//                                                   child: Container(
//                                                     height: 300,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     25))),
//                                                     child:
//                                                         SingleChildScrollView(
//                                                       child: Column(
//                                                         children: e
//                                                             .productDescription
//                                                             .map<Widget>(
//                                                                 (e) => ListTile(
//                                                                       title: Text(
//                                                                           "${e[0]}"),
//                                                                       subtitle:
//                                                                           Text(
//                                                                               "${e[1]}"),
//                                                                     ))
//                                                             .toList(),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ));
//                                       },
//                                       child: Text("View Description")),
//                                   Text(
//                                     "${e.selectedItem * e.productPrize}",
//                                     style: TextStyle(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceAround,
//                                     children: [
//                                       IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             if (e.selectedItem > 1) {
//                                               e.selectedItem -= 1;
//                                             }
//                                           });
//                                         },
//                                         icon: Icon(Icons.remove,
//                                             color: Colors.red),
//                                       ),
//                                       Text(
//                                         "${e.selectedItem.toString()}",
//                                         style: TextStyle(
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.w500),
//                                       ),
//                                       IconButton(
//                                         onPressed: () {
//                                           setState(() {
//                                             e.selectedItem += 1;
//                                           });
//                                         },
//                                         icon: Icon(Icons.add,
//                                             color: Colors.green),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   ElevatedButton(
//                                     style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 Colors.green)),
//                                     onPressed: () {},
//                                     child: Text("Buy"),
//                                   ),
//                                   ElevatedButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         cartItem.remove(e);
//                                       });
//                                     },
//                                     style: ButtonStyle(
//                                         backgroundColor:
//                                             MaterialStateProperty.all(
//                                                 Colors.red)),
//                                     child: Text("Remove To\n Cart"),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         )),
//                   ))
//               .toList(),
//           Divider(
//             thickness: 2,
//           ),
//           Text(
//             "Total Product - ${cartItem.length}\n",
//             style: TextStyle(
//                 fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
//           ),
//           Text(
//             "Total Amount - $totalAmount",
//             style: TextStyle(
//                 fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue),
//           ),
//           Divider(
//             thickness: 2,
//           )
//         ]),
//       ),
//     );
//   }
// }

import 'package:Ecommerce/controller/cart_total.dart';
import 'package:Ecommerce/controller/catalog_product.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/controller/cart_controller.dart';
// import 'package:Ecommerce/controller/product_controller.dart';
import 'package:Ecommerce/screen/product/detail_product.dart';
import 'package:get/get.dart';
import 'package:Ecommerce/screen/product/list_product.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mycolors.PrimaryColor,
        title: Text('You\'r Cart'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Obx(() => SizedBox(
              height: 600,
              child: ListView.builder(
                  itemCount: controller.listProduct.length,
                  itemBuilder: (ctx, index) {
                    return CartProductCard(
                      controller: controller,
                      product: controller.listProduct.keys.toList()[index],
                      quantity: controller.listProduct.values.toList()[index],
                      index: index,
                    );
                  }),
            )),
      ),
    );
  }
}
