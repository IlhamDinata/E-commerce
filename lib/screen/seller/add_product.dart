import 'dart:io';

import 'package:Ecommerce/utils/mycolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Ecommerce/controller/addproduct_controller.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final AddProductController controller = Get.find();
  // final TextEditingController _controllerText = TextEditingController();

  // Widget _entryText(
  //   TextEditingController controller,
  //   InputDecoration labelText,
  // ) {
  //   return TextField(
  //     controller: controller,
  //     cursorColor: mycolors.blackColor,
  //     decoration: InputDecoration(
  //         fillColor: mycolors.whiteColor,
  //         labelStyle: mycolors().regular,
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
  //         )),
  //   );
  // }

  Widget buildGridView() {
    return GridView.count(
        crossAxisCount: 5,
        children: List.generate(controller.images.length, (index) {
          Asset asset = controller.images[index];
          return AssetThumb(asset: asset, width: 75, height: 75);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        titleTextStyle: mycolors().bold,
        backgroundColor: mycolors.whiteColor,
        elevation: 0,
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
          TextButton(
            onPressed: () {
              //controller.save();
              controller
                  .addNewProduct; //(controller.description!.text, controller.price!.toString(), controller.name!.text, controller.previewPickedImage!.name);

              controller.uploadPhotoProduct(controller.uuid);
            },
            child: Text(
              "Simpan",
              style: mycolors().blueregular,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("Yuk, Isi Informasi Produkmu",
                        style: mycolors().boldtitle),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Photo Product",
                      style: mycolors().bold,
                    ),
                    TextButton(
                      onPressed: () {
                        controller.selectImageProduct();
                      },
                      child: Text(
                        "Add",
                        style: mycolors().blueregular,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GetBuilder<AddProductController>(
                      builder: (controller) => controller.previewPickedImage !=
                              null
                          ? Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(controller.previewPickedImage!.path),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              height: 75,
                              width: 75,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: mycolors.grey,
                                  width: 1,
                                  style: BorderStyle.solid,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(1),
                                  topRight: Radius.circular(1),
                                  bottomLeft: Radius.circular(1),
                                  bottomRight: Radius.circular(1),
                                ),
                              ),
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.clearPhoto();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: mycolors.grey,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: controller.name,
                  cursorColor: mycolors.blackColor,
                  decoration: InputDecoration(
                      label: Text("Product Name"),
                      labelStyle: mycolors().regular,
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.zero)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: controller.price,
                  cursorColor: mycolors.blackColor,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text("Price"),
                      labelStyle: mycolors().regular,
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.zero)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: controller.description,
                  cursorColor: mycolors.blackColor,
                  decoration: InputDecoration(
                      label: Text("Description"),
                      labelStyle: mycolors().regular,
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.zero)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
