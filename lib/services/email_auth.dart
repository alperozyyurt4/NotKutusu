import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notkutusu/LoginPage/login_page.dart';
import 'package:notkutusu/functions/navi_func.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> signUpFunction(
    BuildContext context, TextEditingController emailController, TextEditingController passwordController) async {
  try {
    // Kullanıcıyı Firebase Authentication'a kaydet, ancak giriş yapma.
    await _auth.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // E-posta doğrulama e-postası gönderildi.
    await _auth.currentUser!.sendEmailVerification();

    print('E-posta doğrulama e-postası gönderildi.');

    // Bildirim göster
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('E-posta Onayı'),
          content: const Text('Lütfen e-postanızı onaylayın.'),
          actions: [
            TextButton(
              onPressed: () {
                emailController.clear();
                passwordController.clear();
                NavigatorPage(context, page: const LoginPage());
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  } on FirebaseAuthException catch (e) {
    print('Hata: $e');
  } catch (e) {
    print('Hata: $e');
  }
}
