import 'package:flutter/material.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';

//* Global controllers hepsi için baştan tanımlamaya gerek kalmadı
final userNameController = TextEditingController();
final passwordController = TextEditingController();

//* Global textler
const userNameText = 'Kullanıcı Adı';
const passwordText = 'Şifre';
const emailText = '@st.biruni.edu.tr';
const loginText = 'Giriş Yap';

class GirisYap extends StatelessWidget with ColorsUtility, LoginWidgetsTextStyle {
  GirisYap({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String username = userNameController.text;
        String password = passwordController.text;
        print('$userNameText: $username');
        print('$password: $password');
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
class Sifre extends StatelessWidget with ColorsUtility {
  Sifre({super.key});

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

//* Kullini Adi
class KullaniciAdi extends StatelessWidget with ColorsUtility, LoginWidgetsTextStyle {
  KullaniciAdi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: userNameController,
        decoration: InputDecoration(
          labelText: userNameText,
          suffixText: emailText,
          suffixStyle: emailTextStyle,
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

//* üye ol
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          onPressed: () {},
          child: const Text(
            'Hemen Üye Olun!',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
