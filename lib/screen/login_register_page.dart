import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Ecommerce/utils/mycolors.dart';
import 'package:Ecommerce/utils/pages.dart';
import 'package:get/get.dart';
import '../auth.dart';
import '../utils/dimens.dart';
import '../utils/social_button.dart';
import '../utils/validation_input.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  final Auth controller = Get.put(Auth());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    await Auth().signInWithEmailAndPassword(
      email: _controllerEmail.text,
      password: _controllerPassword.text,
    );
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _entryfieldemail(
    // String title,
    TextEditingController controller,
    // decoration
  ) {
    return TextField(
      controller: controller,
      // textInputAction: TextInputAction.next,
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

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  bool validation() {
    return ValidationInput.validationInputNotEmpty(_controllerEmail.text) &&
        ValidationInput.validationInputNotEmpty(_controllerPassword.text) &&
        ValidationInput.isEmailValid(_controllerEmail.text);
  }

  void showError() {
    if (_controllerEmail.text.isEmpty) {
      Get.snackbar('Error', 'Email can\'t be empty');
    } else if (!ValidationInput.isEmailValid(_controllerEmail.text)) {
      Get.snackbar('Error', 'Must be valid email');
    } else if (_controllerPassword.text.isEmpty) {
      Get.snackbar('Error', 'Password can\'t be empty');
    }
  }

  Widget _submitButton() {
    return InkWell(
      // style: Elevate
      //Button.styleFrom(primary: mycolors.PrimaryColor),
      onTap: () {
        if (validation()) {
          signInWithEmailAndPassword();
        } else {
          showError();
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
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      // child: Text('Login', selectionColor: mycolors.PrimaryColor),
    );
  }

  Widget _login() {
    return TextButton(onPressed: () {}, child: Text('login'));
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
            _errorMessage(),
            SizedBox(height: Dimens(context).height * 0.02),
            _submitButton(),
            SizedBox(height: Dimens(context).height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have any account? ',
                  style: mycolors().NormalTextStyle,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppPages.register);
                  },
                  child: Text(
                    'Register here',
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
