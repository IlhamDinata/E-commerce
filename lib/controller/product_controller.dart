import 'package:get/get.dart';
import 'package:Ecommerce/screen/services/firestore_db.dart';

import '../screen/product/model/product.dart';

class ProductController extends GetxController {
  final products = <Product>[].obs;

  @override
  void onInit() {
    products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
