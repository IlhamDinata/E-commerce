import 'package:Ecommerce/screen/product/detail_product.dart';
import 'package:get/get.dart';
import 'package:Ecommerce/screen/product/model/product.dart';

import '../screen/product/model/product.dart';

class CartController extends GetxController {
  var listProduct = {}.obs;

  void addProduct(Product product) {
    if (listProduct.containsKey(product)) {
      listProduct[product] += 1;
    } else {
      listProduct[product] = 1;
    }

    Get.snackbar(
      "Product Added",
      "You have added the ${product.name} to the cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 1),
    );
  }

  void removeProduct(Product product) {
    if (listProduct.containsKey(product) && listProduct[product] == 1) {
      listProduct.removeWhere((key, value) => key == product);
    } else {
      listProduct[product] -= 1;
    }
  }

  get products => listProduct;

  get productSubTotal => listProduct.entries
      .map((product) => product.key.price * product.value)
      .toList();

  // get itemCount => listProduct.entries.map((product) => product.value).toList;

  // get itemCountFinal => listProduct.entries.length;

  // get total => listProduct.entries
  //     .map((product) => product.key.price * product.value)
  //     .toList()
  //     .reduce((value, element) => value + element)
  //     .toStringAsFixed(2);

  get total {
    return productSubTotal.fold(
        0, (previousValues, element) => previousValues + element);
  }

  get adminFee => 1;

  get finalTotal => total + adminFee;

  // Add product in the cart

  // var listProduct = <Product>[].obs;

  // void addProduct(Product product) {
  //   listProduct.add(product);
  //  // // if (listProduct.contains(product)) {
  //  // //   listProduct[product] += 1;
  //  // // } else {
  //  // //   listProduct[product] = 1;
  //  // // }
  //   Get.snackbar(
  //     "Product Added",
  //     "You have added the ${product.name} to the cart",
  //     snackPosition: SnackPosition.BOTTOM,
  //     duration: Duration(seconds: 2),
  //   );
  // }

  get Countitem => listProduct.entries.map((product) => product.value).toList();

  get itemCount {
    return Countitem.fold(
        0, (previousValues, element) => previousValues + element);
  }

  // // void removeProduct(Product products) {
  // //   if (listProduct.contains(products) && listProduct[products] == 1) {
  // //     listProduct.removeWhere((keys, values) => keys == products);
  // //   } else {
  // //     listProduct[products] -= 1;
  // //   }
  // // }

  //// void removeProduct() {
  ////   if (listProduct.value > 1) {
  ////     listProduct.value--;
  ////   }
  //// }

//   void removeProduct(int index) {
//     if (listProduct.isNotEmpty) {
//       listProduct.removeAt(index);
//     }
//   }

//   get products => listProduct;
}

//
