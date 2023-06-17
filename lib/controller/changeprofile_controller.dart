import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../auth.dart';
// HALAMAN INI TIDAK TERPAKAI DULU

class ChangeProfileController extends GetxController {
  final User? user = Auth().currentUser;
  late TextEditingController usernameCP;
  late TextEditingController emailCP;
  late TextEditingController phoneNumberCP;
  // String? profilePickLink;

  Future<void> updateProfile() async {
    await Auth().currentUser!.updateDisplayName(usernameCP.text);
    // await Auth().currentUser!.updateEmail(emailCP.text);
    // await Auth().currentUser!.updatePhoneNumber(phoneCredential);
    // await Auth().currentUser!.updatePhotoURL(profilePickLink);
  }

  get yourUserName => Auth().currentUser!.displayName.toString();
  get yourEmail => Auth().currentUser!.email.toString();
  get yourPhoneNumber => Auth().currentUser!.phoneNumber.toString();
  get yourPhotoProfile => Auth().currentUser!.photoURL.toString();
  // get yourUpdatePhoto => Image.network(profilePickLink!);

  @override
  void onInit() {
    super.onInit();
    usernameCP = TextEditingController(text: '${yourUserName}');
    emailCP = TextEditingController(text: '${yourEmail}');
    phoneNumberCP = TextEditingController(text: '${yourPhoneNumber}');
  }

  // @override
  // void onClose() {
  //   usernameCP.dispose();
  //   emailCP.dispose();
  //   phoneNumberCP.dispose();
  //   super.onClose();
  // }
}
