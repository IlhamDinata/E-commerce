import 'package:Ecommerce/controller/cart_controller.dart';
import 'package:Ecommerce/controller/cart_icon.dart';
import 'package:Ecommerce/controller/product_controller.dart';
import 'package:Ecommerce/screen/product/detail_product.dart';

import 'package:Ecommerce/utils/mycolors.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProductListPage extends StatelessWidget {
  final cartController = Get.put(CartController());
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: mycolors.PrimaryColor,
            title: Text('Product List'),
            actions: [
              IconCart(),
            ],
          ),
          body: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading:
                    Image.network(productController.products[index].imageUrl),
                title: Text(productController.products[index].name),
                subtitle: Text(
                    '\$${productController.products[index].price.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) =>
                          ProductDetailPage(productController.products[index]),
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
