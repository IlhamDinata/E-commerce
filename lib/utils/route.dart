import 'package:Ecommerce/screen/cart_combine.dart';
import 'package:Ecommerce/screen/chatroom/chatroom.dart';
import 'package:Ecommerce/screen/checkout.dart';
import 'package:Ecommerce/screen/home_page.dart';
import 'package:Ecommerce/screen/product/detail_product.dart';
import 'package:Ecommerce/screen/product/list_product.dart';
import 'package:Ecommerce/screen/appbar/cart.dart';
import 'package:Ecommerce/screen/product/model/product.dart';
import 'package:Ecommerce/screen/appbar/notif.dart';
import 'package:Ecommerce/screen/kategori/electronic.dart';
import 'package:Ecommerce/screen/kategori/sport.dart';
import 'package:Ecommerce/screen/kategori/ticket.dart';
import 'package:Ecommerce/screen/kategori/topup.dart';
import 'package:Ecommerce/screen/login_register_page.dart';
import 'package:Ecommerce/screen/register_page.dart';
import 'package:Ecommerce/screen/chatroom/chatroom_home.dart';
import 'package:Ecommerce/screen/setting.dart';
import 'package:Ecommerce/screen/wishlist.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoute {
  static const initial = AppPages.login;
  static final pages = [
    GetPage(name: PagesPath.login, page: () => const LoginPage()),
    GetPage(name: PagesPath.home, page: () => Homepage()),
    GetPage(name: PagesPath.register, page: () => const RegisterPage()),
    GetPage(name: PagesPath.homechat, page: () => const HomeChatRoom()),
    GetPage(name: PagesPath.chatroom, page: () => const ChatRoom()),
    GetPage(name: PagesPath.wishlist, page: () => const Wishlist()),
    GetPage(name: PagesPath.setting, page: () => SettingPage()),
    GetPage(name: PagesPath.topup, page: () => const TopUpPage()),
    GetPage(name: PagesPath.ticket, page: () => const TicketPage()),
    GetPage(name: PagesPath.notif, page: () => const NotificationPage()),
    GetPage(name: PagesPath.cartcombine, page: () => CartCombine()),
    GetPage(name: PagesPath.checkoutpage, page: () => CheckOutPage()),
    GetPage(name: PagesPath.electronic, page: () => const ElectronicPage()),
    GetPage(name: PagesPath.sports, page: () => const SportPage()),
    GetPage(
        name: PagesPath.productdetail,
        page: () => ProductDetailPage(Product(
            id: '1',
            name: 'product 1',
            price: 10,
            imageUrl: 'assets/testprouct1.png',
            description: 'Bola sepak'))),
    GetPage(name: PagesPath.listproduct, page: () => ProductListPage()),
  ];
}
