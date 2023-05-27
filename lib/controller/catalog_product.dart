import 'package:Ecommerce/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/controller/cart_controller.dart';
// import 'package:Ecommerce/screen/product/detail_product_screen.dart';
import 'package:get/get.dart';

import '../screen/product/model/product.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  final productController = Get.put(ProductController());

  CartProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
            itemCount: controller.listProduct.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                product: controller.listProduct.keys.toList()[index],
                quantity: controller.listProduct.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;

  const CartProductCard({
    Key? key,
    required this.controller,
    required this.product,
    required this.quantity,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              radius: 40, backgroundImage: NetworkImage(product.imageUrl)),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(product.name)),
          Expanded(child: Text('\$ ${product.price}')),
          IconButton(
            onPressed: () {
              controller.removeProduct(product);
            },
            icon: Icon(Icons.remove_circle),
          ),
          Text('$quantity'),
          IconButton(
            onPressed: () {
              controller.addProduct(product);
            },
            icon: Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }

// import 'package:Ecommerce/screen/product/model/product.dart';
// import 'package:flutter/material.dart';

// class CatalogProducts extends StatelessWidget {
//   const CatalogProducts({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       child: ListView.builder(
//         itemCount: Product.products.length,
//         itemBuilder: (BuildContext context, int index) {
//           return CatalogProductCard(index: index);
//         },
//       ),
//     );
//   }
// }

// class CatalogProductCard extends StatelessWidget {
//   final int index;
//   CatalogProductCard({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
}
