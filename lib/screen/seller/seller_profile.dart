import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SellerProfile extends StatefulWidget {
  const SellerProfile({super.key});

  @override
  State<SellerProfile> createState() => _SellerProfileState();
}

Widget _iconKategori(
  String title,
  Icon icon,
  GestureTapCallback ontap,
) {
  return InkWell(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: mycolors.whiteColor),
      child: Row(
        verticalDirection: VerticalDirection.down,
        children: [
          icon,
          SizedBox(
            width: 3,
          ),
          Text(
            title,
            style: mycolors().bold,
          ),
        ],
      ),
    ),
  );
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Store"),
        titleTextStyle: TextStyle(
            color: mycolors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        elevation: 0,
        backgroundColor: mycolors.whiteColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: mycolors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              IconlyBold.chat,
              color: mycolors.blackColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              color: mycolors.blackColor,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(14),
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage('assets/market.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            "No Name Store",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: mycolors.blackColor,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "0 Follower",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: mycolors.blackColor,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Skor Performa Toko",
                      style: mycolors().lightGrey,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            "62",
                            style: mycolors().blueregular,
                          ),
                          Text(
                            "/100",
                            style: mycolors().lightGrey,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.keyboard_arrow_right,
                              color: mycolors.darkGrey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                height: 45,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: mycolors.PrimaryColor,
                      width: 1.5,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.align_vertical_bottom_rounded),
                        Text(
                          "Power Merchant",
                          style: mycolors().bold,
                        )
                      ],
                    ),
                    Text(
                      "Upgrade",
                      style: mycolors().blueregular,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Saldo",
                      style: mycolors().medium,
                    ),
                    Text(
                      "Rp. 300",
                      style: mycolors().bold,
                    ),
                  ],
                ),
              ),
              Container(
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: mycolors.whiteColor),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: mycolors.grey,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PENJUALAN",
                            style: mycolors().medium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text("Lihat Riwayat",
                                style: mycolors().blueregular),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _iconKategori(
                            "Pesanan Baru",
                            Icon(
                              Icons.wallet_travel,
                              color: mycolors.PrimaryColor,
                            ),
                            () {},
                          ),
                          _iconKategori(
                            "Siap Dikirim",
                            Icon(
                              Icons.trolley,
                              color: mycolors.PrimaryColor,
                            ),
                            () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: mycolors.grey,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PRODUK",
                            style: mycolors().medium,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Tambah Produk",
                              style: mycolors().blueregular,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ListTile(
                        onTap: () {},
                        leading: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daftar Produkmu",
                              style: mycolors().bold,
                            ),
                            Text(
                              "2 Produk",
                              style: mycolors().lightGrey,
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: mycolors.grey,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "KATA PEMBELI",
                            style: mycolors().medium,
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.star_border),
                            title: Text(
                              "Ulasan",
                              style: mycolors().regular,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.chat),
                            title: Text(
                              "Diskusi",
                              style: mycolors().regular,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.card_travel),
                            title: Text(
                              "Pesanan Dikomplain",
                              style: mycolors().regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: mycolors.grey,
                    ),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bantuan Dan Info Lainnya",
                            style: mycolors().bold,
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.sell),
                            title: Text(
                              "Pusat Edukasi Seller",
                              style: mycolors().regular,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.call),
                            title: Text(
                              "Bantuan E-Commerce Care",
                              style: mycolors().regular,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.settings),
                            title: Text(
                              "Pengaturan Toko",
                              style: mycolors().regular,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
