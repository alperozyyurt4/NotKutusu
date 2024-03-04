import 'package:flutter/material.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/infopage/info_widgets.dart';

class InfoPage extends StatelessWidget with ColorsUtility {
  InfoPage({super.key});

  //* Card sayısını8
  final int cardCount = 6;

  @override
  Widget build(BuildContext context) {
    const String appBarUygulamaHakkinda = "Uygulama Hakkında";

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: whiteColor),
          title: Text(appBarUygulamaHakkinda, style: TextStyle(color: whiteColor)),
          backgroundColor: appBlue),
      body: Padding(
        padding: const EdgeInsets.all(20.0),

        //* List view
        child: ListView.separated(
          itemCount: cardCount,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10); // Her kart arasında 10 birimlik boşluk
          },
          itemBuilder: (BuildContext context, int index) {
            return InfoPageCard(
              index: index + 1,
              text: 'Derslerinizi kaydedin ve ders adı, dönemi ve öğretmeni gibi bilgileri tutun.',
            );
          },
        ),
      ),
    );
  }
}
