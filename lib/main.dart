import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/screen/bottom_navbar.dart';
import 'package:Ecommerce/screen/login_register_page.dart';
import 'package:Ecommerce/utils/route.dart';
import 'package:Ecommerce/widget_tree.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppRoute.pages,
      home: const WidgetTree(),
    );
  }
}
