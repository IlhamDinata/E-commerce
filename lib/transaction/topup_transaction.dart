import 'package:Ecommerce/screen/bottom_navbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:Ecommerce/utils/mycolors.dart';

import 'package:Ecommerce/controller/topup_transaction_controller.dart';

class TopUpTransactionSuccess
    extends GetView<TopUpTransactionSuccessController> {
  TopUpTransactionSuccess({Key? key}) : super(key: key);
  final topUpTransactionSuccessController =
      Get.lazyPut<TopUpTransactionSuccessController>(
          () => TopUpTransactionSuccessController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mycolors.PrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 278,
                width: 278,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Success.png'),
                    scale: 2.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Transaction Success',
                style: mycolors().semibold.copyWith(
                      fontSize: 18,
                      color: Colors.white,
                    ),
              ),
              Text(
                'Yashh!! enjoy your bill\nDon\'t forget to check on your history',
                style: mycolors().regular.copyWith(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(BottomNavBar());
                },
                child: Container(
                  height: 55,
                  width: Get.width * 0.8,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Back to Home',
                    style: mycolors().semibold.copyWith(
                          fontSize: 18,
                          color: mycolors.purple,
                        ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
