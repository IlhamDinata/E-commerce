import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    Key? key,
  }) : super(key: key);

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
            onTap: () {},
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
