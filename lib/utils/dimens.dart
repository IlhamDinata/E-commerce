import 'package:flutter/material.dart';

class Dimens {
  BuildContext context;
  Dimens(this.context); //constructor
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  Size get size => MediaQuery.of(context).size;
}
