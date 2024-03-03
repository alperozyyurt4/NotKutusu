import 'package:flutter/material.dart';
import 'package:notkutusu/LoginPage/info_page.dart';
import 'package:notkutusu/UploadNotePage/note_page.dart';
import 'package:notkutusu/homepage/drawer/drawer_widgets.dart';
import 'package:notkutusu/homepage/home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade100,
      child: Column(
        children: [
          //*logo

          DrawerHeader(
            child: Center(
              child: Icon(Icons.menu_sharp, size: 40, color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),

          const MenuWidgets(text: 'PROFİLE', icon: Icons.account_circle, page: HomePage()),
          const MenuWidgets(text: 'MY NOTES', icon: Icons.my_library_books, page: AddPage()),
          const MenuWidgets(text: 'SETTİNGS', icon: Icons.settings, page: InfoPage()),

          const ExitButton(text: 'Cıkış Yap'),
        ],
      ),
    );
  }
}
