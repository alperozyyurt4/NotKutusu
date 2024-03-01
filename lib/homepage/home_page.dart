import 'package:flutter/material.dart';
import 'package:notkutusu/LoginPage/login_widgets.dart';
import 'package:notkutusu/NotePage/note_page.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';
import 'package:notkutusu/functions/navi_func.dart';
import 'package:notkutusu/homepage/home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with ColorsUtility, AppBarTextStyle {
  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height; //* Cihaz uygunluğu
    const double topMarginPercentage =
        0.05; //* Üstten mesafe yüzde olarak ayarlanabilir

    const String userName = "Adil Sain";
    const String departmentName = "Bilgisayar Mühendisliği";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.19),
        child: AppBar(
          actions: [HelpIcon(), AccountIcon()],
          backgroundColor: appBlue,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: screenHeight * topMarginPercentage),
                child: Column(
                  children: [
                    AppBarText(textType: userName, appBarStyle: titleStyle),
                    AppBarText(
                        textType: departmentName, appBarStyle: subTitleStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: DersAra(),
                  ),
                  NotAraButton(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                HomePageCard(
                    cardName: 'Kaydedilenler',
                    callback: () {},
                    cardIcon: Icon(Icons.stars, size: 55, color: whiteColor)),
                HomePageCard(
                    cardName: 'Not Ekle',
                    callback: () {
                      NavigatorPage(context, page: AddPage());
                    },
                    cardIcon:
                        Icon(Icons.control_point, size: 55, color: whiteColor)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
