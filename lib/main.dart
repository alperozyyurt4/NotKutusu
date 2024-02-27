import 'package:flutter/material.dart';
import 'package:notkutusu/loginpage/login_page.dart';
import 'package:notkutusu/LoginPage/login_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.transparent,
          elevation: 1,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: const LoginPage(),

    );
  }
}
