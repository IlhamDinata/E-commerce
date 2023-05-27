import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../auth.dart';
import '../utils/dimens.dart';
import '../utils/mycolors.dart';
import '../utils/pages.dart';
import '../utils/social_button.dart';
import '../utils/validation_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerReTypePassword =
      TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      Get.snackbar("success", "Register Successfully");
      Get.offAllNamed(AppPages.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("error", e.message.toString());
    }
  }

  bool validation(String email, String password, String confirmPassword) {
    return ValidationInput.validationInputNotEmpty(email) &&
        ValidationInput.validationInputNotEmpty(password) &&
        ValidationInput.isEmailValid(email) &&
        ValidationInput.isConfirmPasswordMatch(password, confirmPassword);
  }

  void showError(String email, String password, String confirmPassword) {
    if (email.isEmpty) {
      Get.snackbar('Error', 'Email can\'t be empty');
    } else if (!ValidationInput.isEmailValid(email)) {
      Get.snackbar('Error', 'Must be valid email');
    } else if (password.isEmpty) {
      Get.snackbar('Error', 'Password can\'t be empty');
    } else if (!ValidationInput.isConfirmPasswordMatch(
        password, confirmPassword)) {
      Get.snackbar('Error', 'Please make sure you\r password match');
    }
  }

  Widget _entryfieldemail(
    // String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          icon: Icon(Icons.email_outlined),
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: "Email"),
    );
  }

  Widget _entryfieldpassword(
    // String title,
    TextEditingController controller,
    // decoration
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: "Password"),
    );
  }

  Widget _entryfieldretypepassword(
    // String title,
    TextEditingController controller,
    // decoration
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          fillColor: Colors.white,
          border: InputBorder.none,
          hintText: "Re-Type Password"),
    );
  }

  Widget _submitButton() {
    return InkWell(
      // style: ElevatedButton.styleFrom(primary: mycolors.PrimaryColor),
      onTap: () {
        if (validation(_controllerEmail.text, _controllerPassword.text,
            _controllerReTypePassword.text)) {
          createUserWithEmailAndPassword();
        } else {
          showError(_controllerEmail.text, _controllerPassword.text,
              _controllerReTypePassword.text);
        }
      },
      child: Container(
        width: 100,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: mycolors.PrimaryColor,
        ),
        child: Center(
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: _entryfieldemail(_controllerEmail),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child: _entryfieldpassword(_controllerPassword),
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      child:
                          _entryfieldretypepassword(_controllerReTypePassword),
                    ))
              ],
            ),
            SizedBox(height: Dimens(context).height * 0.03),
            _submitButton(),
            SizedBox(height: Dimens(context).height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'already have an account? ',
                  style: mycolors().NormalTextStyle,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppPages.login);
                  },
                  child: Text(
                    'Login here',
                    style: mycolors().BlueTextStyle,
                  ),
                )
              ],
            ),
            SizedBox(height: Dimens(context).height * 0.02),
            SocialButton(),
          ],
        ),
      ),
    );
  }
}
