import 'package:get/get.dart';
import 'package:Ecommerce/screen/product/model/product.dart';

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

  get total {
    return productSubTotal.fold(
        0, (previousValues, element) => previousValues + element);
  }

  get adminFee => 1;

  get finalTotal => total + adminFee;

  get Countitem => listProduct.entries.map((product) => product.value).toList();

  get itemCount {
    return Countitem.fold(
        0, (previousValues, element) => previousValues + element);
  }
}
