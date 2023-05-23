import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/utils/dimens.dart';
import 'package:badges/badges.dart';
import 'package:flutter_application_1/utils/mycolors.dart';
import 'package:flutter_application_1/utils/pages.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage(this.product);
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Details'), actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.shopping_cart,
            color: mycolors.whiteColor,
          ),
          onPressed: () {
            Get.toNamed(AppPages.cart);
          },
        )
      ]),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                  child: Column(
            children: [
              Image.asset(product.imageUrl),
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
              child: Text('Add to cart'),
              onPressed: () {
                cartController.addProduct(Product(
                    id: product.id,
                    name: product.name,
                    price: product.price,
                    imageUrl: product.imageUrl,
                    description: product.description));
                print(cartController.listProduct.length);
                print(cartController.listProduct[0].name);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final int id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}
