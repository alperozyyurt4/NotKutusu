import 'package:flutter/material.dart';

class DropMenu extends StatefulWidget {
  DropMenu({super.key, required this.list, required this.dropdownValue, required this.text});

  String dropdownValue;
  final List<String> list;
  final String text;

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(widget.text),
            DropdownMenu<String>(
              width: 350,
              initialSelection: widget.list.first,
              onSelected: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  widget.dropdownValue = value!;
                });
              },
              dropdownMenuEntries: widget.list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ],
        ),
      ],
    );
  }
}
