import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/utils/mycolors.dart';
import 'package:flutter_application_1/utils/pages.dart';
import 'package:get/get.dart';
import '../auth.dart';
import '../utils/dimens.dart';
import '../utils/social_button.dart';
import '../utils/validation_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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

  Widget _entryfield(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      // textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: title,
      ),
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
    return ElevatedButton(
      onPressed: () {
        if (validation()) {
          signInWithEmailAndPassword();
        } else {
          showError();
        }
      },
      child: Text('Login'),
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
          children: <Widget>[
            _entryfield('email', _controllerEmail),
            _entryfield('password', _controllerPassword),
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
