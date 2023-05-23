import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/cart_controller.dart';
import 'package:flutter_application_1/controller/product_controller.dart';
import 'package:flutter_application_1/screen/product/detail_product.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/screen/product/list_product.dart';

class CartPage extends StatelessWidget {
  final CartController controller = Get.find();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
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
                      product: controller.listProduct[index],
                      quantity: 1,
                      index: index,
                    );
                  }),
            )),
      ),
    );
  }
}
