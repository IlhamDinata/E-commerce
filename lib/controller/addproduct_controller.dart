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

    // final uploadProduct = storageProduct.putFile(file);
    //reset();
    //Get.toNamed(AppPages.sellerprofile);

    // print(uploadProduct);
    //update();

    try {
      final uploadProduct = storageProduct.putFile(file);
      print(uploadProduct);
      update();
    } catch (error) {
      print("error");
    }
  }

  // Future<void> updateProduct(
  //     String name, String price, String description) async {
  //   CollectionReference updateprod = firestore.collection('products');
  //   updateprod.doc('1').update({
  //     "name": name,
  //     "price": price,
  //     "description": description,
  //     "id": 1,
  //     "imageUrl": 1,
  //   });

  //   Product(
  //       name: name, description: description, id: '', imageUrl: '', price: 12);
  // }

  // Future<void> addNewProduct() async {

  //   CollectionReference uploadProducts = firestore.collection('products');
  //   uploadProducts.doc('1').set({
  //     "name": "",
  //     "id": "",
  //     "price": "",
  //     "description": "",
  //     "imageUrl": "",
  //   });

  // final uploadProductsPlease = await uploadProducts.doc(uuid).get();

  // Product(
  //     id: "",
  //     name: uploadProductsPlease["name"],
  //     price: uploadProductsPlease["price"],
  //     imageUrl: uploadProductsPlease["imageUrl"],
  //     description: uploadProductsPlease["description"]);

  // CollectionReference products = firestore.collection('products');
  // Get.offAllNamed(AppPages.sellerprofile);
  // Get.snackbar("add product success", "");
  // products.doc().update({
  //   "name": name,
  //   "price": price,
  //   "description": description,
  //   "imageUrl": previewPickedImage,
  //});

  // Product(
  //   name: name,
  //   price: price,
  //   description: description,
  //   imageUrl: previewPickedImage,
  //   id: '',
  // );

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
  // }

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
