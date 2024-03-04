import 'package:flutter/material.dart';
import 'package:notkutusu/InfoPage/info_page.dart';
import 'package:notkutusu/homepage/home_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: const BottomAppBar(
          elevation: 0,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.favorite)),
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [const HomePage(), InfoPage()],
        ),
      ),
    );
  }
}
