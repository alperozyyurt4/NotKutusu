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
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
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
                                child: Text('Kaydedilenler',
                                    style: TextStyle(color: whiteColor, fontSize: 25, fontWeight: FontWeight.bold)),
                              ),
                            ))),
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // İstenen yuvarlama miktarını burada ayarlayabilirsiniz
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
                              child: const Icon(Icons.stars, size: 55),
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
        ),
      ),
    );
  }
}

//* Help icon
// ignore: must_be_immutable
class HelpIcon extends StatelessWidget with IconUtility {
  HelpIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.help),
      highlightColor: iconClick,
      iconSize: iconSize,
    );
  }
}

//* ACcount icon
// ignore: must_be_immutable
class AccountIcon extends StatelessWidget with IconUtility {
  AccountIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.person),
      highlightColor: iconClick,
      iconSize: iconSize,
    );
  }
}
