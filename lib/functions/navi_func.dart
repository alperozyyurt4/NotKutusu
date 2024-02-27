import 'package:flutter/material.dart';

Future<dynamic> NavigatorPage(BuildContext context, {required Widget page}) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
