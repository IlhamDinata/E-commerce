import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TopUpPaketDataPage extends StatelessWidget {
  const TopUpPaketDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mycolors.PrimaryColor,
        title: Text('Paket Data'),
      ),
    );
  }
}
