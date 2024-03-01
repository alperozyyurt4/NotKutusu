import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notkutusu/functions/navi_func.dart';
import 'package:notkutusu/homepage/home_page.dart';

Future<void> loginFunction(BuildContext context, TextEditingController emailController,
    TextEditingController passwordController, FirebaseAuth auth) async {
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    User? user = userCredential.user;

    if (user != null) {
      // Kullanıcı e-posta doğrulama işlemini tamamlamış mı kontrol et
      if (user.emailVerified) {
        print('Giriş başarılı: ${user.email}');
        // Giriş başarılıysa, istediğiniz sayfaya yönlendirebilirsiniz.
        emailController.clear();
        passwordController.clear();
        // Örneğin:
        NavigatorPage(context, page: const HomePage());
      } else {
        print('E-posta onaylanmadığı için giriş yapılamadı.');
        // Kullanıcı e-posta doğrulama işlemini tamamlamamışsa, uyarı verebilirsiniz.
      }
    }
  } on FirebaseAuthException catch (e) {
    print('Giriş başarısız: $e');
  } catch (e) {
    print('Hata: $e');
  }
}
