import 'dart:io';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../utils/pages.dart';

class AddProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Asset> images = <Asset>[];

  var uuid = Uuid().v4();

  FirebaseStorage storage = FirebaseStorage.instance;

  late TextEditingController? name;
  late TextEditingController? price;
  late TextEditingController? description;

  late ImagePicker imagePicker;
  XFile? previewPickedImage = null;

  void selectImageProduct() async {
    try {
      final checkDataImageProduct = await imagePicker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 90,
          maxHeight: 175,
          maxWidth: 175);

      if (checkDataImageProduct != null) {
        print(checkDataImageProduct.name);
        print(checkDataImageProduct.path);
        previewPickedImage = checkDataImageProduct;
      }
      update();
    } catch (error) {
      print(error);
      previewPickedImage = null;
      update();
    }
  }

  Future<void> reset() async {
    previewPickedImage = null;
    name = null;
    price = null;
    description = null;
    update();
  }

  void clearPhoto() {
    previewPickedImage = null;
    update();
  }

  Future<void> save() async {
    await uploadPhotoProduct;
    reset();
    Get.toNamed(AppPages.sellerprofile);
  }

  Future<void> uploadPhotoProduct(String uuid) async {
    Reference storageProduct = storage.ref('PhotoProduct/$uuid');

    File file = File(previewPickedImage!.path);

    try {
      final uploadProduct = storageProduct.putFile(file);
      print(uploadProduct);
      update();
    } catch (error) {
      print("error");
    }
  }

  @override
  void onInit() {
    super.onInit();
    imagePicker = ImagePicker();
    name = TextEditingController();
    description = TextEditingController();
    price = TextEditingController();
  }

  // @override
  // void onClose() {
  //   name.dispose();
  //   description.dispose();
  //   price.dispose();
  //   super.onClose();
  // }
}
