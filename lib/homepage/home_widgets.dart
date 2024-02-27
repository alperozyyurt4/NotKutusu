import 'package:flutter/material.dart';
import 'package:notkutusu/constant/icon_utility.dart';

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Card(
                    shape: const CircleBorder(),
                    child: Container(
                        color: Colors.blue,
                        height: screenHeight * 0.07,
                        width: screenWidth * 0.41,
                        child: const Center(
                            child: Text(
                          'Kaydedilenler',
                          style: TextStyle(color: Colors.red),
                        ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45),
                    child: Card(
                      child: Container(
                          color: Colors.red,
                          width: screenWidth * 0.41,
                          height: screenHeight * 0.15,
                          child: const Text('')),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
