import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Setting",
        ),
        titleTextStyle: TextStyle(
            color: mycolors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: mycolors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
