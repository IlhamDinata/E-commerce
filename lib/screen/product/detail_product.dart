import 'package:Ecommerce/controller/cart_icon.dart';
import 'package:Ecommerce/controller/product_controller.dart';
import 'package:Ecommerce/screen/product/model/product.dart';
import 'package:Ecommerce/screen/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/controller/cart_controller.dart';
import 'package:Ecommerce/utils/dimens.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:badges/badges.dart' as badges;
// import 'package:Ecommerce/controller/count_controller.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  // final CartController controller = Get.find();

  ProductDetailPage(this.product);
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();

  // int productItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mycolors.PrimaryColor,
          title: Text('Product Details'),
          actions: [
            IconCart(),
            // IconButton(
            //     icon: Icon(
            //       IconlyBold.heart,
            //       color: mycolors.whiteColor,
            //     ),
            //     onPressed: () {
            //       Get.toNamed(AppPages.wishlist);
            //     }),
            // IconButton(
            //   icon: Icon(
            //     Icons.shopping_cart,
            //     color: mycolors.whiteColor,
            //   ),
            //   onPressed: () {
            //     Get.toNamed(AppPages.cartcombine);
            //   },
            // ),
          ]),
      // body: SingleChildScrollView(
      //   child: Container(
      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height,
      //     child: Column(
      //       children: [
      //         Image.network(
      //           product.imageUrl,
      //           fit: BoxFit.fill,
      //         ),
      //         SizedBox(
      //           height: 15,
      //         ),
      //         Container(
      //           padding: EdgeInsets.all(15),
      //           child: Column(
      //             children: [
      //               Text(
      //                 product.name,
      //                 style:
      //                     TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      //               ),
      //               SizedBox(
      //                 height: 15,
      //               ),
      //               Row(
      //                 children: [
      //                   Text(

      //                   )
      //                 ],)
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Image.network(product.imageUrl),
              // SizedBox(
              //   height: Dimens(context).height * 0.02,
              // ),
              // InkWell(
              //   onTap: () {
              //     Get.to(() => Wishlist());
              //   },
              //   child: Padding(
              //     padding: EdgeInsets.only(
              //       left: 2,
              //       right: 2,
              //     ),
              //     child: badges.Badge(
              //         badgeContent: Text(
              //           "9",
              //           style: const TextStyle(color: Colors.white),
              //         ),
              //         child: Icon(IconlyBold.heart)),
              //   ),
              // ),
              SizedBox(height: Dimens(context).height * 0.02),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: Dimens(context).height * 0.02),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: Dimens(context).height * 0.02),
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ))),
          Container(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: mycolors.PrimaryColor),
              child: Text('Add to Cart'),
              onPressed: () {
                cartController.addProduct(product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
