//* Cardlar -
import 'package:flutter/material.dart';

class InfoPageCard extends StatelessWidget {
  const InfoPageCard({super.key, required this.index, required this.text});
  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          '$index. $text',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
