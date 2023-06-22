import 'package:Ecommerce/screen/product/model/user_model.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:Ecommerce/widget_tree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';

class Auth extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // final User? user = Auth().currentUser; // masalah baru stackoverflow wkwk saling memanggil 2 class

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? currentUserGoogle;
  UserCredential? userCredential;

  var user = UsersModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
    // Get.offAllNamed(AppPages.login);
    Restart.restartApp(webOrigin: AppPages.login);

    // await _firebaseAuth.currentUser!.displayName ?? 'No name';
    // cara update name dari auth
  }

  Future<void> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.signIn().then((value) => currentUserGoogle = value);
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        print(currentUserGoogle);
        print("udah login");

        final googleAuth = await currentUserGoogle!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("User Credential");
        print(userCredential);

        CollectionReference users = firestore.collection('users');
        users.doc(currentUser!.email).set({
          "uid": userCredential!.user!.uid,
          "name": currentUser!.displayName,
          "email": currentUser!.email,
          "photoUrl": currentUser!.photoURL,
          "phoneNumber": currentUser!.phoneNumber,
          "address": "",
          // "createTime":
          //     userCredential!.user!.metadata.creationTime!.toIso8601String(),
          // "lastSignIn":
          //     userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final userRN = await users.doc(currentUser!.email).get();
        final userRNData = await userRN.data() as Map<String, dynamic>;

        user(UsersModel(
          uid: userRN["uid"],
          name: userRN["name"],
          email: userRN["email"],
          phoneNumber: userRN["phoneNumber"],
          photoUrl: userRN["photoUrl"],
        ));

        Get.offAllNamed(AppPages.bottomnavbar);
      } else {
        print("gagal login");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
    Restart.restartApp(webOrigin: AppPages.login);
  }

  void changeProfile(String name, String phoneNumber, String email) {
    CollectionReference users = firestore.collection('users');
    users.doc(currentUser?.email).update({
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
    });

    user(UsersModel(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    ));

    user.refresh();
  }

  void updatePhotoUrl(String url) async {
    CollectionReference users = firestore.collection('users');

    await users.doc(currentUser!.email).update(
      {
        "photoUrl": url,
      },
    );

    user.update((user) {
      user!.photoUrl = url;
    });
    user.refresh();
  }
}
