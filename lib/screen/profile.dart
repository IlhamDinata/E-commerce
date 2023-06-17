import 'package:Ecommerce/controller/changeprofile_controller.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../auth.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ChangeProfileController controller = Get.put(ChangeProfileController());
  // final ChangeProfileController controller = Get.find();
  // void controller = Get.lazyPut(() => ChangeProfileController());
  // final GoogleSignInAccount? user = Auth().currentUserGoogle; // login with google
  final User? user = Auth().currentUser; // login with email

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
                    // decoration: BoxDecoration(
                    //   color: Colors.black38,
                    //   borderRadius: BorderRadius.circular(100),
                    // ),
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
                                      Auth().currentUser!.photoURL.toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                    ),
                  ),
                  // child: Container(
                  //   margin: EdgeInsets.all(14),
                  //   width: 175,
                  //   height: 175,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black38,
                  //     borderRadius: BorderRadius.circular(100),
                  //     image: DecorationImage(
                  //       image: NetworkImage(
                  //           Auth().currentUser!.photoURL.toString()),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
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


























// class SettingPage extends StatefulWidget {
//   SettingPage({super.key});

//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }

// class _SettingPageState extends State<SettingPage> {
//   String? profilePickLink;

//   final User? user = Auth().currentUser;

//   void pickUploadImage() async {
//     final image = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxHeight: 512,
//         maxWidth: 512,
//         imageQuality: 75);

//     Reference ref = FirebaseStorage.instance.ref().child("pngwing.com.png");

//     await ref.putFile(File(image!.path));

//     profilePickLink = await ref.getDownloadURL();

//     await Auth().currentUser!.updatePhotoURL(profilePickLink);
//   }

//   // Widget _profilePicture() {
//   Future<void> signOut() async {
//     await Auth().signOut();
//   }

//   Widget _userUid() {
//     return Text(user?.email ?? 'User email');
//   }

//   Widget _userName() {
//     return Text(FirebaseAuth.instance.currentUser!.displayName ?? 'No Name');
//   }

//   Widget _signOutButton() {
//     return ElevatedButton(
//         style: ElevatedButton.styleFrom(primary: mycolors.PrimaryColor),
//         onPressed: signOut,
//         child: const Text('Sign Out'));
//   }

//   @override
//   Widget build(BuildContext context) {
//     MediaQuery.of(context).size.height;
//     MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Container(
//           height: double.infinity,
//           width: double.infinity,
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // GestureDetector(
//               //     onTap: () {
//               //       pickUploadImage();
//               //     },
//               //     child: Container(
//               //       margin: const EdgeInsets.only(top: 80, bottom: 24),
//               //       height: 120,
//               //       width: 120,
//               //       alignment: Alignment.center,
//               //       decoration: BoxDecoration(
//               //         borderRadius: BorderRadius.circular(20),
//               //         color: mycolors.PrimaryColor,
//               //       ),
//               //       child: Center(
//               //           child: profilePickLink == null
//               //               ? Auth().currentUser!.photoURL == null
//               //                   ? const Icon(
//               //                       Icons.person,
//               //                       color: Colors.white,
//               //                       size: 20,
//               //                     )
//               //                   : ClipRRect(
//               //                       borderRadius: BorderRadius.circular(20),
//               //                       child: Image.network(Auth()
//               //                           .currentUser!
//               //                           .photoURL
//               //                           .toString()),
//               //                     )
//               //               : ClipRRect(
//               //                   borderRadius: BorderRadius.circular(20),
//               //                   child: Image.network(profilePickLink!),
//               //                 )),
//               //     )),
//               _userName(),
//               _userUid(),
//               _signOutButton()
//             ],
//           )),
//     );
//   }
// }




// // class SettingPage extends StatefulWidget {
// //   SettingPage({super.key});

// //   final User? user = Auth().currentUser;

// //   Future<void> signOut() async {
// //     await Auth().signOut();
// //   }

// //   @override
// //   State<SettingPage> createState() => _SettingPageState();
// // }



// // class _SettingPageState extends State<SettingPage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Container(
// //       height: double.infinity,
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(20),
// //       child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             _userUid(),
// //             _signOutButton(),
// //           ]),
// //     ));
// //   }
// // }
