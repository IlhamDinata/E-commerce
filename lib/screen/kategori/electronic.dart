import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/mycolors.dart';
import 'package:flutter_application_1/utils/pages.dart';
import 'package:get/get.dart';

class ElectronicPage extends StatelessWidget {
  const ElectronicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.sports_basketball,
                color: mycolors.blackColor,
              ),
              onPressed: () {
                Get.toNamed(AppPages.listproduct);
              },
            ),
            Text('Test list Product')
          ],
        ),
      ),
    );
  }
}
