import 'package:Ecommerce/controller/changeprofile_controller.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ChangeProfileController controller = Get.put(ChangeProfileController());

  final User? user = Auth().currentUser;
  final Auth authPC = Get.find();

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userName() {
    return Text(
      FirebaseAuth.instance.currentUser!.displayName ?? 'No Name',
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _userUid() {
    return Text(
      user?.email ?? 'User email',
      style: TextStyle(
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
        titleTextStyle: TextStyle(
            color: mycolors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: mycolors.whiteColor,
        actions: [
          IconButton(
            onPressed: () {
              signOut();
            },
            icon: Icon(
              Icons.logout,
              color: mycolors.blackColor,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                AvatarGlow(
                  endRadius: 100,
                  glowColor: mycolors.blackColor,
                  duration: Duration(seconds: 3),
                  child: Container(
                    margin: EdgeInsets.all(14),
                    width: 175,
                    height: 175,
                    child: Center(
                      child: Auth().currentUser!.photoURL == null
                          ? Container(
                              margin: EdgeInsets.all(14),
                              width: 175,
                              height: 175,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: AssetImage('assets/pngwing.com.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.all(14),
                              width: 175,
                              height: 175,
                              decoration: BoxDecoration(
                                color: Colors.black38,
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      Auth().currentUser!.photoURL!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                _userName(),
                _userUid(),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppPages.changeprofile);
                    },
                    leading: Icon(Icons.person),
                    title: Text(
                      "Change Profile",
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppPages.sellerprofile);
                    },
                    leading: Icon(Icons.shop_2),
                    title: Text(
                      "Swith to Seller",
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                  ListTile(
                    onTap: () {
                      Get.toNamed(AppPages.setting);
                    },
                    leading: Icon(Icons.settings),
                    title: Text(
                      "Setting",
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.only(bottom: context.mediaQueryPadding.bottom + 10),
            child: Column(
              children: [
                Text(
                  "E-Commerce App",
                  style: TextStyle(color: Colors.black45),
                ),
                Text(
                  "Demo Version",
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
