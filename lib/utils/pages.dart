import 'package:flutter/material.dart';

class AppPages {
  static const login = PagesPath.login;
  static const home = PagesPath.home;
  static const register = PagesPath.register;
  static const roomchat = PagesPath.roomchat;
  static const wishlist = PagesPath.wishlist;
  static const setting = PagesPath.setting;
  static const topup = PagesPath.topup;
  static const ticket = PagesPath.ticket;
  static const notif = PagesPath.notif;
  static const cart = PagesPath.cart;
  static const electronic = PagesPath.electronic;
  static const sports = PagesPath.sports;
  static const productdetail = PagesPath.productdetail;
  static const listproduct = PagesPath.listproduct;
}

abstract class PagesPath {
  static const login = '/login';
  static const home = '/home';
  static const register = '/register';
  static const roomchat = '/roomchat';
  static const wishlist = '/wishlist';
  static const setting = '/setting';
  static const topup = '/topup';
  static const ticket = '/ticket';
  static const notif = '/notif';
  static const cart = '/cart';
  static const electronic = '/electronic';
  static const sports = '/sports';
  static const productdetail = '/productdetail';
  static const listproduct = '/listproduct';
}
