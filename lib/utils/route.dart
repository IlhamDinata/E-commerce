import 'package:Ecommerce/profile/changeprofile.dart';
import 'package:Ecommerce/profile/setting.dart';
import 'package:Ecommerce/screen/Topup/paketdata/paketdata_page.dart';
import 'package:Ecommerce/screen/Topup/pulsa/pulsapage.dart';
import 'package:Ecommerce/screen/bottom_navbar.dart';
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
import 'package:Ecommerce/screen/profile.dart';
import 'package:Ecommerce/screen/seller/seller_profile.dart';
import 'package:Ecommerce/screen/wishlist.dart';
import 'package:Ecommerce/transaction/topup_transaction.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoute {
  static const initial = AppPages.login;
  static final pages = [
    GetPage(name: PagesPath.changeprofile, page: () => ChangeProfile()),
    GetPage(name: PagesPath.setting, page: () => SettingPage()),

    GetPage(name: PagesPath.chatroom, page: () => const ChatRoom()),

    GetPage(
        name: PagesPath.topuptransactionsuccess,
        page: () => TopUpTransactionSuccess()),

    GetPage(name: PagesPath.notif, page: () => const NotificationPage()),

    GetPage(name: PagesPath.checkoutpage, page: () => CheckOutPage()),

    // sign in
    GetPage(name: PagesPath.login, page: () => LoginPage()),
    GetPage(name: PagesPath.register, page: () => const RegisterPage()),

    // home screen
    GetPage(name: PagesPath.bottomnavbar, page: () => BottomNavBar()),
    GetPage(name: PagesPath.home, page: () => Homepage()),
    GetPage(name: PagesPath.wishlist, page: () => const Wishlist()),
    GetPage(name: PagesPath.profile, page: () => ProfilePage()),
    GetPage(name: PagesPath.homechat, page: () => const HomeChatRoom()),

    // product
    GetPage(
        name: PagesPath.productdetail,
        page: () => ProductDetailPage(Product(
            id: '1',
            name: 'product 1',
            price: 10,
            imageUrl: 'assets/testprouct1.png',
            description: 'Bola sepak'))),
    GetPage(name: PagesPath.listproduct, page: () => ProductListPage()),

    // cart
    GetPage(name: PagesPath.cartcombine, page: () => CartCombine()),

    // top up
    GetPage(name: PagesPath.topup, page: () => const TopUpPage()),
    GetPage(name: PagesPath.topuppulsa, page: () => TopUpPulsaPage()),
    GetPage(
        name: PagesPath.topuppaketdata, page: () => const TopUpPaketDataPage()),

    // category
    GetPage(name: PagesPath.electronic, page: () => const ElectronicPage()),
    GetPage(name: PagesPath.sports, page: () => SportPage()),
    GetPage(name: PagesPath.ticket, page: () => const TicketPage()),

    // seller
    GetPage(name: PagesPath.sellerprofile, page: () => SellerProfile()),
  ];
}
