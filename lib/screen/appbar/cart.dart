import 'package:Ecommerce/controller/catalog_product.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/controller/cart_controller.dart';

import 'package:get/get.dart';

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
