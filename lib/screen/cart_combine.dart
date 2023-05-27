import 'package:Ecommerce/screen/appbar/cart.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/controller/cart_total.dart';

class CartCombine extends StatelessWidget {
  const CartCombine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Expanded(child: CartPage()),
          CartTotal(),
        ],
      ),
    ));
  }
}
