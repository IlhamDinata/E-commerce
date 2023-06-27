import 'package:Ecommerce/controller/cart_icon.dart';
import 'package:Ecommerce/controller/product_controller.dart';

import 'package:Ecommerce/screen/product/model/product.dart';

import 'package:flutter/material.dart';
import 'package:Ecommerce/controller/cart_controller.dart';
import 'package:Ecommerce/utils/dimens.dart';
import 'package:Ecommerce/utils/mycolors.dart';

import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage(this.product);
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: mycolors.PrimaryColor,
          title: Text('Product Details'),
          actions: [
            IconCart(),
          ]),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Image.network(product.imageUrl),
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
