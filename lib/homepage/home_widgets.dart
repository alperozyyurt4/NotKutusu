import 'package:flutter/material.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/icon_utility.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> with ColorsUtility, IconUtility {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: DersAra(),
                  ),
                  NotAraButton(),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Card(
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: appBlue),
                                  height: screenHeight * 0.07,
                                  width: screenWidth * 0.41,
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text('Kaydedilenler',
                                          style: TextStyle(
                                              color: whiteColor,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // İstenen yuvarlama miktarını burada ayarlayabilirsiniz
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      color: normalBlue,
                                      width: screenWidth * 0.41,
                                      height: screenHeight * 0.15,
                                      child: const Text('')),
                                  Container(
                                    child: Icon(Icons.stars,
                                        size: 55, color: whiteColor),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: appBlue),
                              height: screenHeight * 0.07,
                              width: screenWidth * 0.41,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text('Not Ekle',
                                      style: TextStyle(
                                          color: whiteColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 45),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // İstenen yuvarlama miktarını burada ayarlayabilirsiniz
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      color: normalBlue,
                                      width: screenWidth * 0.41,
                                      height: screenHeight * 0.15,
                                      child: const Text('')),
                                  Container(
                                      child: Icon(Icons.control_point,
                                          size: 55, color: whiteColor))
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
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

const dersAraText = 'Ders Ara';

class DersAra extends StatefulWidget {
  const DersAra({super.key});

  @override
  State<DersAra> createState() => _DersAraState();
}

class _DersAraState extends State<DersAra> with ColorsUtility {
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
      child: Text('Ders Ara'),
    );
  }
}
