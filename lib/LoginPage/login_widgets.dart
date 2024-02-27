import 'package:flutter/material.dart';

class GirisYap extends StatelessWidget {
  const GirisYap({
    super.key,
    required TextEditingController usernameController,
    required TextEditingController passwordController,
  })  : _usernameController = usernameController,
        _passwordController = passwordController;

  final TextEditingController _usernameController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        String username = _usernameController.text;
        String password = _passwordController.text;
        print('Kullanıcı Adı: $username');
        print('Şifre: $password');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 15),
      ),
      child: Text(
        'Giriş Yap',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
      ),
    );
  }
}

class Sifre extends StatelessWidget {
  const Sifre({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: _passwordController,
        decoration: InputDecoration(
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
  const KullaniciAdi({
    super.key,
    required TextEditingController usernameController,
  }) : _usernameController = usernameController;

  final TextEditingController _usernameController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: _usernameController,
        decoration: InputDecoration(
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
