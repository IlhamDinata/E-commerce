import 'package:Ecommerce/controller/cart_controller.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class IconCart extends StatelessWidget {
  final CartController controller = Get.find();
  IconCart({super.key});

  bool _showBadgeCart() {
    if (controller.itemCount.toString() == "0") {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            badgeAnimation: badges.BadgeAnimation.scale(
                animationDuration: Duration(milliseconds: 300)),
            showBadge: _showBadgeCart(),
            badgeContent: Text('${controller.itemCount}'),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: mycolors.whiteColor,
              ),
              onPressed: () {
                Get.toNamed(AppPages.cartcombine);
              },
            ),
          ),
        ));
  }
}
