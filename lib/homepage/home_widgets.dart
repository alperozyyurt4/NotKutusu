import 'package:flutter/material.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/icon_utility.dart';

class HomePageCard extends StatelessWidget with ColorsUtility {
  HomePageCard({super.key, required this.cardName, required this.callback, required this.cardIcon});
  String cardName;
  VoidCallback callback;
  Icon cardIcon;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: callback,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Card(
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: appBlue),
                  height: screenHeight * 0.07,
                  width: screenWidth * 0.41,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(cardName,
                          style: TextStyle(color: whiteColor, fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // İstenen yuvarlama miktarını burada ayarlayabilirsiniz
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          color: normalBlue,
                          width: screenWidth * 0.41,
                          height: screenHeight * 0.15,
                          child: Image.network(
                            'https://img.pixers.pics/pho_wat(s3:700/FO/40/38/06/35/700_FO40380635_44897dfb180569c91098c06ce36a60de.jpg,700,469,cms:2018/10/5bd1b6b8d04b8_220x50-watermark.png,over,480,419,jpg)/cikartmalar-eski-tugla-duvar-dokusu-arkaplan.jpg.jpg',
                            width: screenWidth * 0.41, // İstenen genişlik
                            height: screenHeight * 0.15, // İstenen yükseklik
                            fit: BoxFit.cover, // İmgenin nasıl sığacağını belirleyen fit özell
                          )),
                      Container(child: cardIcon)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//* Help icon
// ignore: must_be_immutable
class HelpIcon extends StatelessWidget with IconUtility, ColorsUtility {
  HelpIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.help),
      highlightColor: iconClick,
      iconSize: iconSize,
      color: whiteColor,
    );
  }
}

//* ACcount icon
// ignore: must_be_immutable
class AccountIcon extends StatelessWidget with IconUtility, ColorsUtility {
  AccountIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.person),
      highlightColor: iconClick,
      iconSize: iconSize,
      color: whiteColor,
    );
  }
}

//* Ders Ara Text

class DersAra extends StatefulWidget {
  const DersAra({super.key});

  @override
  State<DersAra> createState() => _DersAraState();
}

class _DersAraState extends State<DersAra> with ColorsUtility {
  final String dersAraText = 'Ders Ara';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          labelText: dersAraText,
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: normalBlue, width: 2.0),
          ),
        ),
      ),
    );
  }
}

//* Not Ara Button

class NotAraButton extends StatefulWidget {
  const NotAraButton({super.key});

  @override
  State<NotAraButton> createState() => _NotAraButtonState();
}

class _NotAraButtonState extends State<NotAraButton> with ColorsUtility {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: appBlue,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 155, vertical: 15),
      ),
      child: const Text('Ders Ara'),
    );
  }
}
