import 'package:flutter/material.dart';
import 'package:notkutusu/InfoPage/info_page.dart';
import 'package:notkutusu/LoginPage/login_widgets.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';
import 'package:notkutusu/functions/navi_func.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ColorsUtility, AppBarTextStyle {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height; //* Cihaz uygunluğu
    const double topMarginPercentage = 0.05; //* Üstten mesafe yüzde olarak ayarlanabilir

    //* Text isim değişkenleri
    const String universtyName = "Biruni Üniversitesi";
    const String applicationName = "Not Kutusu";

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.19),
          child: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      NavigatorPage(context, page: InfoPage());
                    },
                    icon: const Icon(Icons.info),
                    color: whiteColor,
                    iconSize: 35.0)
              ],
              backgroundColor: appBlue,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: screenHeight * topMarginPercentage),
                      child: Column(children: [
                        AppBarText(textType: universtyName, appBarStyle: titleStyle),
                        AppBarText(textType: applicationName, appBarStyle: subTitleStyle),
                      ]))
                ],
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 120, width: 150, child: Image.asset('assets/biruni.logo.jpg')),
              ],
            ),
            UserNameTextField(),
            const SizedBox(height: 15),
            PasswordTextField(),
            const SizedBox(height: 15),
            LoginButton(),
            const SizedBox(height: 10),
            const SignUpTextButton(),
          ],
        ),
      ),
    );
  }
}
