import 'package:flutter/material.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';
import 'package:notkutusu/services/email_auth.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

const userNameText = 'Ad';
const userSurNameText = 'Soyad';
const userDepertmantText = 'Bölüm';
const userEmailText = 'Email';
const userPasswordText = 'Şifre';

//* Sign Up email

class SingUpEmail extends StatefulWidget {
  const SingUpEmail({super.key});

  @override
  State<SingUpEmail> createState() => _SingUpEmailState();
}

class _SingUpEmailState extends State<SingUpEmail> with ColorsUtility {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          labelText: userEmailText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: normalBlue, width: 2.0),
          ),
          prefixIcon: const Icon(Icons.email),
        ),
      ),
    );
  }
}

//* Sing Up password

class SignUpPassword extends StatefulWidget {
  const SignUpPassword({super.key});

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> with ColorsUtility {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: passwordController,
        decoration: InputDecoration(
          labelText: userPasswordText,
          border: const OutlineInputBorder(),
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

//* Sign Up Button

class SignUpBUtton extends StatefulWidget {
  const SignUpBUtton({super.key});

  @override
  State<SignUpBUtton> createState() => _SignUpBUttonState();
}

class _SignUpBUttonState extends State<SignUpBUtton> with ColorsUtility, LoginWidgetsTextStyle {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        signUpFunction(context, emailController, passwordController);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: appBlue,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 15),
      ),
      child: Text('Kayıt Ol', style: loginTextStyle),
    );
  }
}
