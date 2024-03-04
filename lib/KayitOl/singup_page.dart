import 'package:flutter/material.dart';
import 'package:notkutusu/KayitOl/singup_widgets.dart';
import 'package:notkutusu/LoginPage/login_widgets.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';

class SingPage extends StatefulWidget {
  const SingPage({super.key});

  @override
  State<SingPage> createState() => _SingPageState();
}

class _SingPageState extends State<SingPage> with ColorsUtility, AppBarTextStyle {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height; //* Cihaz uygunluğu
    const double topMarginPercentage = 0.05; //* Üstten mesafe yüzde olarak ayarlanabilir
    const String universtyName = "Biruni Üniversitesi";
    const String applicationName = "Not Kutusu";

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.19),
          child: AppBar(
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.info), color: whiteColor, iconSize: 35.0)],
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
            ),
          ),
        ),
        body: Container(
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SingUpEmail(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SignUpPassword(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: SignUpBUtton(),
              )
            ],
          ),
        ));
  }
}
