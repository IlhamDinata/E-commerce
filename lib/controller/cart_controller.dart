import 'package:flutter_application_1/screen/product/detail_product.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/screen/product/list_product.dart';

class CartController extends GetxController {
  // Add product in the cart

  var listProduct = <Product>[].obs;

  void addProduct(Product product) {
    listProduct.add(product);
    // if (listProduct.contains(product)) {
    //   listProduct[product] += 1;
    // } else {
    //   listProduct[product] = 1;
    // }
    Get.snackbar(
      "Product Added",
      "You have added the ${product.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  // void removeProduct(Product products) {
  //   if (listProduct.contains(products) && listProduct[products] == 1) {
  //     listProduct.removeWhere((keys, values) => keys == products);
  //   } else {
  //     listProduct[products] -= 1;
  //   }
  // }

  // void removeProduct() {
  //   if (listProduct.value > 1) {
  //     listProduct.value--;
  //   }
  // }

  void removeProduct(int index) {
    if (listProduct.isNotEmpty) {
      listProduct.removeAt(index);
    }
  }

  get products => listProduct;
}

//
