import 'package:flutter_application_1/screen/home_page.dart';
import 'package:flutter_application_1/screen/product/detail_product.dart';
import 'package:flutter_application_1/screen/product/list_product.dart';
import 'package:flutter_application_1/screen/appbar/cart.dart';
import 'package:flutter_application_1/screen/appbar/notif.dart';
import 'package:flutter_application_1/screen/kategori/electronic.dart';
import 'package:flutter_application_1/screen/kategori/sport.dart';
import 'package:flutter_application_1/screen/kategori/ticket.dart';
import 'package:flutter_application_1/screen/kategori/topup.dart';
import 'package:flutter_application_1/screen/login_register_page.dart';
import 'package:flutter_application_1/screen/register_page.dart';
import 'package:flutter_application_1/screen/room_chat.dart';
import 'package:flutter_application_1/screen/setting.dart';
import 'package:flutter_application_1/screen/wishlist.dart';
import 'package:flutter_application_1/utils/pages.dart';
import 'package:get/get.dart';

class AppRoute {
  static const initial = AppPages.login;
  static final pages = [
    GetPage(name: PagesPath.login, page: () => const LoginPage()),
    GetPage(name: PagesPath.home, page: () => Homepage()),
    GetPage(name: PagesPath.register, page: () => const RegisterPage()),
    GetPage(name: PagesPath.roomchat, page: () => const Roomchat()),
    GetPage(name: PagesPath.wishlist, page: () => const Wishlist()),
    GetPage(name: PagesPath.setting, page: () => SettingPage()),
    GetPage(name: PagesPath.topup, page: () => const TopUpPage()),
    GetPage(name: PagesPath.ticket, page: () => const TicketPage()),
    GetPage(name: PagesPath.notif, page: () => const NotificationPage()),
    GetPage(name: PagesPath.cart, page: () => CartPage()),
    GetPage(name: PagesPath.electronic, page: () => const ElectronicPage()),
    GetPage(name: PagesPath.sports, page: () => const SportPage()),
    GetPage(
        name: PagesPath.productdetail,
        page: () => ProductDetailPage(Product(
            id: 1,
            name: 'product 1',
            price: 10.00,
            imageUrl: 'assets/testprouct1.png',
            description: 'Bola sepak'))),
    GetPage(name: PagesPath.listproduct, page: () => ProductListPage()),
  ];
}
