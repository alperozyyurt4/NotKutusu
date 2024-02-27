import 'package:flutter/material.dart';
import 'package:notkutusu/loginpage/info_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height; // Cihaz uygunluğu
    final double topMarginPercentage =
        0.05; // Üstten mesafe yüzde olarak ayarlanabilir

    // Text isim değişkenleri
    final String appBarText1 = "Biruni Üniversitesi";
    final String appBarText2 = "Not Kutusu";

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.19),
        child: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage()),
                );
              },
              icon: Icon(Icons.info),
              color: Colors.white,
              iconSize: 35.0,
            )
          ],
          backgroundColor: Colors.blue[800],
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: screenHeight * topMarginPercentage),
                child: Column(
                  children: [
                    Text(
                      appBarText1,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                    ),
                    Text(
                      appBarText2,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/biruni.logo.jpg'),
                height: 120,
                width: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
