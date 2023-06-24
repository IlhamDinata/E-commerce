import 'dart:io';
import 'package:uuid/uuid.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:Ecommerce/screen/product/model/product.dart';

import '../utils/pages.dart';

class AddProductController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Asset> images = <Asset>[];

  // var products = Product().obs;
  var uuid = Uuid().v1();

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

  // void save() {
  //   Get.toNamed(AppPages.sellerprofile);
  //   reset();
  // }

  Future<void> uploadPhotoProduct(String uuuid) async {
    Reference storageProduct = await storage.ref("PhotoProduct/$uuid.png");
    File file = await File(previewPickedImage!.path);

    final uploadProduct = await storageProduct.putFile(file);
    reset();
    Get.toNamed(AppPages.sellerprofile);

    print(uploadProduct);

    try {
      final uploadProduct = storageProduct.putFile(file);
      print(uploadProduct);
    } catch (error) {
      print("error");
    }
  }

  void addNewProduct(
      String name, int price, String description, String previewPickedImage) {
    CollectionReference products = firestore.collection('products');
    Get.offAllNamed(AppPages.sellerprofile);
    Get.snackbar("add product success", "");
    products.doc().update({
      "name": name,
      "price": price,
      "description": description,
      "imageUrl": previewPickedImage,
    });

    Product(
      name: name,
      price: price,
      description: description,
      imageUrl: previewPickedImage,
      id: '',
    );

    // Future<void> loadAssets() async {
    //   List<Asset> resultList = <Asset>[];
    //   String error = 'no error detected';

    //   try {
    //     resultList = await MultipleImagesPicker.pickImages(
    //       maxImages: 5,
    //       enableCamera: true,
    //       selectedAssets: images,
    //       cupertinoOptions: CupertinoOptions(
    //         takePhotoIcon: "chat",
    //       ),
    //       materialOptions: MaterialOptions(
    //           actionBarColor: "#abcdef",
    //           actionBarTitle: "Example",
    //           allViewTitle: "All Photos",
    //           useDetailsView: false,
    //           selectCircleStrokeColor: "#000000"),
    //     );
    //     images = resultList;
    //   } on Exception catch (e) {
    //     error = e.toString();
    //   }
    // }
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
