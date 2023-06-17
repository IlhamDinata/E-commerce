import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth.dart';

class SocialButton extends StatelessWidget {
  SocialButton({Key? key}) : super(key: key);
  final authH = Get.find<Auth>();

  Future<void> signInWithGoogle() async {
    await Auth().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 25,
              height: 25,
              child: Image(
                image: AssetImage('assets/facebook.png'),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              signInWithGoogle();
            },
            child: Container(
              width: 25,
              height: 25,
              child: Image(
                image: AssetImage('assets/google.png'),
              ),
            ),
          ),
        ),
        Container(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 25,
              height: 25,
              child: Image(
                image: AssetImage('assets/instagram.png'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
