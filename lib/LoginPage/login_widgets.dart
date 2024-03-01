import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notkutusu/SingUp/singup_page.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';
import 'package:notkutusu/functions/navi_func.dart';
import 'package:notkutusu/services/email_verify.dart';

//* Global controllers hepsi için baştan tanımlamaya gerek kalmadı
final userNameController = TextEditingController();
final passwordController = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;

//* Global textler
const userNameText = 'Kullanıcı Adı';
const passwordText = 'Şifre';
// const emailText = '@st.biruni.edu.tr';
const loginText = 'Giriş Yap';

//* Login Button
// ignore: must_be_immutable
class LoginButton extends StatelessWidget with ColorsUtility, LoginWidgetsTextStyle {
  LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String username = userNameController.text;
        String password = passwordController.text;
        print('$userNameText: $username');
        print('$password: $password');
        loginFunction(context, userNameController, passwordController, _auth);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appBlue,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 15),
      ),
      child: Text(loginText, style: loginTextStyle),
    );
  }
}

//* Şifre
// ignore: must_be_immutable
class PasswordTextField extends StatelessWidget with ColorsUtility {
  PasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: passwordText,
          //* Textfield border
          border: const OutlineInputBorder(),
          //* Textfield a focus olunca border
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: normalBlue, width: 2.0),
          ),
          prefixIcon: const Icon(Icons.password),
        ),
        obscureText: true,
      ),
    );
  }
}

//* Kullanıcı Adı
// ignore: must_be_immutable
class UserNameTextField extends StatelessWidget with ColorsUtility, LoginWidgetsTextStyle {
  UserNameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: userNameController,
        decoration: InputDecoration(
          labelText: userNameText,
          // suffixText: emailText,
          // suffixStyle: emailTextStyle,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: normalBlue, width: 2.0),
          ),
          prefixIcon: const Icon(Icons.person),
        ),
      ),
    );
  }
}

//* Appbar Text
class AppBarText extends StatefulWidget {
  const AppBarText({super.key, required this.textType, required this.appBarStyle});

  final String textType;
  final TextStyle appBarStyle;

  @override
  State<AppBarText> createState() => _AppBarTextState();
}

class _AppBarTextState extends State<AppBarText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.textType, style: widget.appBarStyle);
  }
}

//* Hemen Üye Ol
class SignUpTextButton extends StatefulWidget {
  const SignUpTextButton({super.key});

  @override
  State<SignUpTextButton> createState() => _SignUpTextButtonState();
}

class _SignUpTextButtonState extends State<SignUpTextButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Hesabınız yok mu?',
          style: TextStyle(fontSize: 17),
        ),
        TextButton(
          onPressed: () {
            NavigatorPage(context, page: const SingPage());
          },
          child: const Text(
            'Hemen Üye Olun!',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
