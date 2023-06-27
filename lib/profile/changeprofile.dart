import 'dart:io';

import 'package:Ecommerce/controller/changeprofile_controller.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:image_picker/image_picker.dart';

import '../auth.dart';

class ChangeProfile extends StatefulWidget {
  ChangeProfile({super.key});

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  final ChangeProfileController controller = Get.find();
  final Auth authCP = Get.find();

  Widget _entryfieldUsername() {
    return TextField(
      controller: controller.usernameCP,
      cursorColor: mycolors.blackColor,
      decoration: InputDecoration(
        labelText: "Username",
        labelStyle: TextStyle(
          color: mycolors.blackColor,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 18,
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Profile",
        ),
        titleTextStyle: TextStyle(
            color: mycolors.blackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        centerTitle: true,
        elevation: 0,
        backgroundColor: mycolors.whiteColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back,
            color: mycolors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.saveProfile();
              authCP.changeProfile(controller.usernameCP.text,
                  controller.phoneNumberCP.text, controller.emailCP.text);
            },
            icon: Icon(
              Icons.save,
              color: mycolors.blackColor,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(22),
        children: [
          AvatarGlow(
            endRadius: 100,
            glowColor: mycolors.blackColor,
            duration: Duration(seconds: 3),
            child: Container(
              margin: EdgeInsets.all(14),
              width: 125,
              height: 125,
              child: Center(
                child: controller.profilePickLink == null
                    ? Auth().currentUser!.photoURL == null
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
                                image:
                                    NetworkImage(Auth().currentUser!.photoURL!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(controller.profilePickLink!),
                      ),
              ),
            ),
          ),
          SizedBox(height: 22),
          TextField(
            controller: controller.usernameCP,
            cursorColor: mycolors.blackColor,
            decoration: InputDecoration(
              labelText: "Username",
              labelStyle: TextStyle(
                color: mycolors.blackColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 18,
              ),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: controller.emailCP,
            cursorColor: mycolors.blackColor,
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(
                color: mycolors.blackColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 18,
              ),
            ),
          ),
          SizedBox(height: 12),
          TextField(
            controller: controller.phoneNumberCP,
            cursorColor: mycolors.blackColor,
            decoration: InputDecoration(
              labelText: "Phone",
              labelStyle: TextStyle(
                color: mycolors.blackColor,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(90),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 18,
              ),
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text("Choose a Picture"),
                GetBuilder<ChangeProfileController>(
                  builder: (controller) => controller.pickedImage != null
                      ? Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(
                                File(controller.pickedImage!.path),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Text("Choose a Picture"),
                ),
                TextButton(
                  onPressed: () {
                    controller.selectImage();
                  },
                  child: Text(
                    "Upload",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25),
          Container(
            width: Get.width,
            child: ElevatedButton(
              onPressed: () {
                controller.updateProfile(Auth().currentUser!.uid);

                Get.snackbar(
                    'Your Profile has been update', 'please click save button');
              },
              child: Text(
                "Update Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: mycolors.whiteColor,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: mycolors.PrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(95),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
