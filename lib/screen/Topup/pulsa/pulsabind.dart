import 'package:get/get.dart';

import 'package:Ecommerce/controller/pulsa_controller.dart';

class TopUpPUlsaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopUpPulsaController>(
      () => TopUpPulsaController(),
    );
  }
}
