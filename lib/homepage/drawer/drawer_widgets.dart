import 'package:flutter/material.dart';
import 'package:notkutusu/LoginPage/login_page.dart';
import 'package:notkutusu/functions/navi_func.dart';

//* Drawer menüsü widget ı
class MenuWidgets extends StatelessWidget {
  const MenuWidgets({super.key, required this.text, required this.icon, required this.page});
  final String text;
  final IconData icon;
  final Widget page;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(text),
        leading: Icon(icon),
        onTap: () {
          NavigatorPage(context, page: page);
        },
      ),
    );
  }
}

//* Çıkış yap butonu
class ExitButton extends StatelessWidget {
  const ExitButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: ElevatedButton(
          onPressed: () {
            NavigatorPage(context, page: const LoginPage());
          },
          child: Text(text)),
    );
  }
}
