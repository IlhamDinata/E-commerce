import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/screen/home_page.dart';
import 'package:flutter_application_1/screen/room_chat.dart';
import 'package:flutter_application_1/screen/setting.dart';
import 'package:flutter_application_1/screen/wishlist.dart';
import 'package:flutter_application_1/utils/mycolors.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  final User? user = Auth().currentUser;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final controller = Get.put(BottomNavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: controller.tabindex,
          children: [
            Homepage(),
            Roomchat(),
            Wishlist(),
            SettingPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: mycolors.PrimaryColor,
          unselectedItemColor: Colors.grey.shade300,
          currentIndex: controller.tabindex,
          onTap: controller.changeTabIndex,
          items: [
            _bottombarItem(IconlyBold.home, "Home"),
            _bottombarItem(IconlyBold.chat, "RoomChat"),
            _bottombarItem(IconlyBold.heart, "Wishlist"),
            _bottombarItem(IconlyBold.profile, "Profile"),
          ],
        ),
      );
    });
  }
}

_bottombarItem(IconData icon, String label) {
  return BottomNavigationBarItem(icon: Icon(icon), label: label);
}
