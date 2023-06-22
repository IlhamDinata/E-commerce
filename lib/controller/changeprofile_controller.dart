import 'dart:io';

import 'package:Ecommerce/utils/pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../auth.dart';

class ChangeProfileController extends GetxController {
  final User? user = Auth().currentUser;
  // final Auth authCP = Get.find();
  late TextEditingController usernameCP;
  late TextEditingController emailCP;
  late TextEditingController phoneNumberCP;
  late ImagePicker imagePicker;

  FirebaseStorage storage = FirebaseStorage.instance;

  XFile? pickedImage = null;
  String? profilePickLink;

  Future<void> saveProfile() async {
    await Auth().currentUser!.updateDisplayName(usernameCP.text);
    await Auth().currentUser!.updateEmail(emailCP.text);
    Get.offAllNamed(AppPages.bottomnavbar);
    Get.snackbar("Update Profile Successfully", "");
  }

  Future<void> updateProfile(String uid) async {
    Reference storageRef = storage.ref("PhotoProfile/$uid.png");
    File file = File(pickedImage!.path);
    profilePickLink = await storageRef.getDownloadURL();
    resetImage();

    try {
      final dataUpload = storageRef.putFile(file);
      print(dataUpload);
    } catch (error) {
      print("error");
    }

    await Auth().currentUser!.updatePhotoURL(profilePickLink);
  }

  void resetImage() {
    pickedImage = null;
    update();
  }

  void selectImage() async {
    try {
      final checkDataImage = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 90,
          maxHeight: 175,
          maxWidth: 175);

      if (checkDataImage != null) {
        print(checkDataImage.name);
        print(checkDataImage.path);
        pickedImage = checkDataImage;
      }
      update();
    } catch (error) {
      print(error);
      pickedImage = null;
      update();
    }
  }

  get yourUserName => Auth().currentUser!.displayName.toString();
  get yourEmail => Auth().currentUser!.email.toString();
  get yourPhoneNumber => Auth().currentUser!.phoneNumber.toString();
  get yourPhotoProfile => Auth().currentUser!.photoURL.toString();

  @override
  void onInit() {
    super.onInit();
    imagePicker = ImagePicker();
    usernameCP = TextEditingController(text: '${yourUserName}');
    emailCP = TextEditingController(text: '${yourEmail}');
    phoneNumberCP = TextEditingController(text: '${yourPhoneNumber}');
  }

  @override
  void onClose() {
    usernameCP.dispose();
    emailCP.dispose();
    phoneNumberCP.dispose();
    super.onClose();
  }
}
