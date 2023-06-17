import 'package:Ecommerce/utils/dimens.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({super.key});

  Widget _iconkategori(
    String title,
    Icon icon,
    GestureTapCallback ontap,
  ) {
    return InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: mycolors.whiteColor),
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              icon,
              Text(title),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mycolors.PrimaryColor,
        title: Text('Top Up'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimens(context).height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _iconkategori('Pulsa', Icon(Icons.phone_android), () {
                      Get.toNamed(AppPages.topuppulsa);
                    }),
                    _iconkategori('Paket Data', Icon(Icons.speaker_phone), () {
                      Get.toNamed(AppPages.topuppaketdata);
                    }),
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
