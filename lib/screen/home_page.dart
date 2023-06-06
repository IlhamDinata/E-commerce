import 'package:Ecommerce/controller/cart_icon.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Ecommerce/auth.dart';
import 'package:Ecommerce/screen/kategori/topup.dart';
import 'package:Ecommerce/screen/product/list_product.dart';
import 'package:Ecommerce/utils/dimens.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Ecommerce/controller/cart_controller.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CartController controller = Get.put(
      CartController()); // get.put cart controller untuk input controller angka icon cart
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final List<String> _carouselImage = [];
  final List<String> _carouselImage2 = [];
  final List<String> _carouselImage3 = [];
  fetchCarouselImage() async {
    QuerySnapshot ContentCollection =
        await FirebaseFirestore.instance.collection("SpecialForYou").get();
    QuerySnapshot ContentCollection2 =
        await FirebaseFirestore.instance.collection("promotion").get();
    QuerySnapshot ContentCollection3 =
        await FirebaseFirestore.instance.collection("PopularProduct").get();
    if (mounted) {
      setState(() {
        for (var i = 0; i < ContentCollection.docs.length; i++) {
          // jika nilai variable 0 adalah nilai minus maka menggunakan kurang dari, jika nilai variable 1 maka menggunakan <= ==
          _carouselImage.add(ContentCollection.docs[i][
              "special"]); // array mulai dari 0, kalau data length mulai dari 1
        }

        for (var a = 0; a < ContentCollection2.docs.length; a++) {
          _carouselImage2.add(ContentCollection2.docs[a]["path"]);
        }

        for (var b = 0; b < ContentCollection3.docs.length; b++) {
          _carouselImage3.add(ContentCollection3.docs[b]["popular"]);
        }
      });
    }
  }

  @override
  void initState() {
    fetchCarouselImage();
    super.initState();
  }

  Widget _iconkategori(
    String title,
    Icon icon,
    GestureTapCallback ontap,
  ) {
    return InkWell(
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: mycolors.whiteColor),
          child: Column(
            verticalDirection: VerticalDirection.down,
            children: [
              icon,
              Text(title),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(39, 22, 231, 1.0),
            ),
            child: Text('Menu'),
          ),
          ListTile(
            title: const Text('menu pertama'),
            onTap: () {
              // Get.toNamed(AppPages.listproduct);
            },
          ),
          ListTile(
            title: const Text('menu kedua'),
            onTap: () {},
          )
        ],
      )),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: mycolors.PrimaryColor,
          ),
          // gradient: LinearGradient(
          //     colors: [mycolors.whiteColor, Colors.blue],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight)),
        ),
        title: Container(
          height: 45,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5)
              ]),
          child: const TextField(
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              hintText: 'Search Product',
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
        elevation: 0.0,
        backgroundColor: mycolors.PrimaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: mycolors.whiteColor,
            ),
            onPressed: () {
              _key.currentState?.openDrawer();
            }),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              color: mycolors.whiteColor,
            ),
            onPressed: () {
              Get.toNamed(AppPages.notif);
            },
          ),
          IconCart(),
          // IconButton(
          //   icon: Icon(
          //     Icons.shopping_cart,
          //     color: mycolors.whiteColor,
          //   ),
          //   onPressed: () {
          //     Get.toNamed(AppPages.cartcombine);
          //   },
          // )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Dimens(context).height * 0.01),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _iconkategori('Top Up', Icon(Icons.phone), () {
                      Get.toNamed(AppPages.topup);
                    }),
                    _iconkategori('Ticket', Icon(Icons.train), () {
                      Get.toNamed(AppPages.ticket);
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: Dimens(context).height * 0.01,
              ),
              AspectRatio(
                aspectRatio: 10 / 4,
                child: CarouselSlider(
                    items: _carouselImage2
                        .map(
                          (item) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Stack(
                                children: [
                                  Image.network(
                                    item,
                                    fit: BoxFit.contain,
                                    width: Dimens(context).width,
                                  )
                                ],
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: mycolors.greyColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 4),
                        aspectRatio: 2.0)),
              ),
              SizedBox(height: Dimens(context).height * 0.02),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _iconkategori('All Product', Icon(Icons.notes_outlined),
                        () {
                      Get.toNamed(AppPages.listproduct);
                    }),
                    _iconkategori('Electronic', Icon(Icons.headphones), () {
                      Get.toNamed(AppPages.electronic);
                    }),
                    _iconkategori('Sport', Icon(Icons.sports_basketball), () {
                      Get.toNamed(AppPages.sports);
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: Dimens(context).height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Special For You",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: mycolors.PrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 6 / 2,
                child: CarouselSlider(
                    items: _carouselImage
                        .map((item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      item,
                                      fit: BoxFit.contain,
                                      width: Dimens(context).width,
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 196, 193, 193),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      aspectRatio: 2.0,
                    )),
              ),
              SizedBox(
                height: Dimens(context).height * 0.01,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: 10,
                  ),
                  child: Text(
                    "Popular Product",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: mycolors.PrimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 4,
                child: CarouselSlider(
                    items: _carouselImage3
                        .map((item) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      item,
                                      fit: BoxFit.contain,
                                      width: Dimens(context).width,
                                    )
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 196, 193, 193),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ))
                        .toList(),
                    options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      aspectRatio: 2.5,
                    )),
              ),
            ],
          ), // sebelum column pasti isinya array
        ),
      ),
    );
  }
}

// column row stack, semua isinya children, children fungsi nya menaruh widget agar bertumpuk, column numpuk nya vertical, row nyamping, stack menumpuk ke depan/belakang
