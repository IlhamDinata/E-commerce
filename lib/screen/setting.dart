import 'package:Ecommerce/utils/mycolors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class SettingPage extends StatelessWidget {
  SettingPage({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: mycolors.PrimaryColor),
        onPressed: signOut,
        child: const Text('Sign Out'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _userUid(),
              _signOutButton(),
            ],
          )),
    );
  }
}

// class SettingPage extends StatefulWidget {
//   SettingPage({super.key});

//   final User? user = Auth().currentUser;

//   Future<void> signOut() async {
//     await Auth().signOut();
//   }

//   @override
//   State<SettingPage> createState() => _SettingPageState();
// }



// class _SettingPageState extends State<SettingPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       height: double.infinity,
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _userUid(),
//             _signOutButton(),
//           ]),
//     ));
//   }
// }
