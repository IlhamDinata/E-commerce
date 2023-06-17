import 'package:Ecommerce/controller/pulsa_controller.dart';
import 'package:Ecommerce/screen/Topup/amount_topup.dart';
import 'package:Ecommerce/screen/payments/topup_payment.dart';
import 'package:Ecommerce/utils/button.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/foundation.dart';
import 'package:Ecommerce/utils/validation_input.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TopUpPulsaPage extends GetView<TopUpPulsaController> {
  TopUpPulsaPage({Key? key}) : super(key: key);
  final pulsaController = Get.lazyPut<TopUpPulsaController>(
    () => TopUpPulsaController(),
  );
  final TextEditingController _controllerPhoneNumber = TextEditingController();

  bool validation() {
    return ValidationInput.isPhoneValid(_controllerPhoneNumber.text);
  }

  void showError() {
    if (_controllerPhoneNumber.text.isEmpty) {
      Get.snackbar('Error', 'Number can\'t be empty');
    } else if (!ValidationInput.isPhoneValid(_controllerPhoneNumber.text)) {
      Get.snackbar('Error', 'Must be valid number');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mycolors.PrimaryColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Pulsa'),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                color: mycolors.whiteColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   'Change nominal \& Phone number',
                    //   style: mycolors().semibold.copyWith(fontSize: 18),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Phone Number',
                      style: mycolors().semibold.copyWith(fontSize: 30),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: mycolors.greyColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        autocorrect: false,
                        onChanged: (value) => controller.readPhoneNumber(value),
                        controller: _controllerPhoneNumber,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Ex. 081234567890',
                          hintStyle: mycolors().semibold.copyWith(
                                fontSize: 12,
                                color: mycolors.greyColor,
                              ),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: controller.phoneNumber < 4
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Amount',
                                style: mycolors().semibold.copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                onTap: () => controller.selectAmount(10000),
                                child: AmountWidgets(
                                  amount: '10.000',
                                  grandTotal: '12.000',
                                  selected: controller.amount == 10000
                                      ? 'selected'
                                      : '',
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                onTap: () => controller.selectAmount(15000),
                                child: AmountWidgets(
                                  amount: '15.000',
                                  grandTotal: '16.000',
                                  selected: controller.amount == 15000
                                      ? 'selected'
                                      : '',
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              GestureDetector(
                                onTap: () => controller.selectAmount(20000),
                                child: AmountWidgets(
                                  amount: '20.000',
                                  grandTotal: '22.000',
                                  selected: controller.amount == 20000
                                      ? 'selected'
                                      : '',
                                ),
                              )
                            ],
                          )),
              ),
            ],
          ),
          Obx(() => Container(
                alignment: Alignment(0.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: controller.amount > 0
                      ? GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return TopUpPayment();
                                });
                          },
                          child: ButtonWidget(
                            label: 'Continue',
                          ))
                      : SizedBox(),
                ),
              ))
        ],
      ),
    );
  }
}
