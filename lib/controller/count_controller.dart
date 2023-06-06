import 'package:get/get.dart';
import 'package:Ecommerce/screen/product/model/product.dart';
import 'package:Ecommerce/controller/cart_controller.dart';

class CountController extends GetxController {
  var listProduct = {}.obs;

  get productItem =>
      listProduct.entries.map((product) => product.value).toList();
}
