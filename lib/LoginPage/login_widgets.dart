import 'package:flutter/material.dart';

class GirisYap extends StatelessWidget {
  GirisYap({super.key});
  final userNameController = TextEditingController();
  final passwordNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String username = KullaniciAdi().userNameController.text;
        String password = Sifre().passwordController.text;
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
  Sifre({super.key});

  final passwordController = TextEditingController();

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
  KullaniciAdi({super.key});

  final userNameController = TextEditingController();
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
