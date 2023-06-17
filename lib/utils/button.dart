import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ecommerce/utils/mycolors.dart';

class ButtonWidget extends StatelessWidget {
  final String? label;
  final Function()? onTap;
  const ButtonWidget({this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: 55,
          width: Get.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: mycolors.PrimaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '${label}',
            style: mycolors().semibold.copyWith(
                  color: Colors.white,
                  fontSize: 18,
                ),
          ),
        ));
  }
}
