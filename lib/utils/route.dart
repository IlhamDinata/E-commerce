import 'package:Ecommerce/screen/cart_combine.dart';
import 'package:Ecommerce/screen/chatroom/chatroom.dart';
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
    GetPage(name: PagesPath.electronic, page: () => const ElectronicPage()),
    GetPage(name: PagesPath.sports, page: () => const SportPage()),
    // GetPage(
    //     name: PagesPath.productdetail,
    //     page: () => ProductDetailPage(
    //           product: Product(
    //             productName: "Apple iPhone 12 (64GB) - Blue",
    //             productRating: 5,
    //             productImage:
    //                 "https://m.media-amazon.com/images/I/71ZOtNdaZCL._SX679_.jpg",
    //             productPrize: 54990,
    //             selectedItem: 1,
    //             productDescription: [
    //               [
    //                 'Display',
    //                 '6.1-inch (15.5 cm diagonal) Super Retina XDR display with True Tone'
    //               ],
    //               ['Capacity', '64GB, 128GB, 256GB'],
    //               [
    //                 'Splash, Water, and Dust Resistant',
    //                 'All-glass and surgical-grade stainless steel design, water and dust resistant (rated IP68)'
    //               ],
    //               ['Batteries', '1 Lithium Ion batteries required. (included)'],
    //               [
    //                 'Camera and Video',
    //                 'Dual 12MP cameras with Portrait mode, Depth Control, Portrait Lighting, Smart HDR, and 4K Dolby Vision HDR video up to 60 fps',
    //               ],
    //               [
    //                 'Front Camera',
    //                 '12MP TrueDepth front camera with Portrait mode, Depth Control, Portrait Lighting, and Smart HDR 3',
    //               ],
    //               [
    //                 'Power and Battery',
    //                 'Video playback:Up to 17 hours, Video playback (streamed):Up to 11 hours, Audio playback:Up to 65 hours, 20W adapter or higher (sold separately), Fast-charge capable: Up to 50% charge in around 30 minutes with 20W adapter or higher',
    //               ],
    //               [
    //                 'In the Box',
    //                 'iPhone with iOS 14, USB-C to Lightning Cable, Documentation',
    //               ],
    //               [
    //                 'Warranty',
    //                 '1 year manufacturer warranty for device and 6 months manufacturer warranty for in-box accessories including batteries from the date of purchase',
    //               ],
    //               [
    //                 'Height',
    //                 '5.78 inches (146.7 mm)',
    //               ],
    //             ],
    //           ),
    //         )),
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
