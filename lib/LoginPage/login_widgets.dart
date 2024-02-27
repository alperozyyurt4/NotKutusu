import 'package:flutter/material.dart';

final userNameController = TextEditingController();
final passwordController = TextEditingController();

class GirisYap extends StatelessWidget {
  const GirisYap({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String username = userNameController.text;
        String password = passwordController.text;
        print('Kullanıcı Adı: $username');
        print('Şifre: $password');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 15),
      ),
      child: const Text(
        'Giriş Yap',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }
}

class Sifre extends StatelessWidget {
  const Sifre({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: passwordController,
        decoration: const InputDecoration(
          labelText: 'Şifre',
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          prefixIcon: Icon(Icons.password),
        ),
        obscureText: true,
      ),
    );
  }
}

class KullaniciAdi extends StatelessWidget {
  const KullaniciAdi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: userNameController,
        decoration: const InputDecoration(
          labelText: 'Kullanıcı Adı',
          suffixText: '@st.biruni.edu.tr',
          suffixStyle: TextStyle(
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          prefixIcon: Icon(Icons.person),
        ),
      ),
    );
  }
}
