import 'package:flutter/material.dart';
import 'package:notkutusu/LoginPage/info_page.dart';
import 'package:notkutusu/LoginPage/login_page.dart';
import 'package:notkutusu/functions/navi_func.dart';

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
              child: Icon(
                Icons.menu_sharp,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //* home

          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 25.0),
            child: ListTile(
              title: const Text('H O M E'),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pop(context),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text('P R O F I L E'),
              leading: const Icon(Icons.person),
              onTap: () => Navigator.pop(context),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: ListTile(
              title: const Text('M Y N O T E S'),
              leading: const Icon(Icons.my_library_books),
              onTap: () => Navigator.pop(context),
            ),
          ),

          //* settings

          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 0),
            child: ListTile(
              title: const Text('S E T T I N G S'),
              leading: const Icon(Icons.settings),
              onTap: () {
                // pop drawer
                Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: ElevatedButton(
                onPressed: () {
                  NavigatorPage(context, page: LoginPage());
                },
                child: Text('Çıkış')),
          ),
        ],
      ),
    );
  }
}
