import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notkutusu/LoginPage/login_widgets.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with ColorsUtility, AppBarTextStyle {
  List<XFile?> _imageFileList = [];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFileList.add(pickedFile);
    });
  }

  void _removeImage(int index) {
    setState(() {
      _imageFileList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height; //* Cihaz uygunluğu
    const double topMarginPercentage =
        0.05; //* Üstten mesafe yüzde olarak ayarlanabilir

    const String userName = "Adil Sain";
    const String departmentName = "Bilgisayar Mühendisliği";

    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
    String dropdownValue = list.first;

    const List<String> list1 = <String>['1', '2', '3', '4'];
    String dropdownValue1 = list.first;

    const List<String> list2 = <String>['Enes', 'Adil', 'Alper', 'Gotik'];
    String dropdownValue2 = list.first;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.19),
        child: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Okuduğunuz bölümü seçiniz ?'),
                    DropdownMenu<String>(
                      width: 350,
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Okuduğunuz sınıfı seçiniz ?'),
                    DropdownMenu<String>(
                      width: 350,
                      initialSelection: list1.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue1 = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list1.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('Dersin kodunu seçiniz ?'),
                    DropdownMenu<String>(
                      width: 350,
                      initialSelection: list2.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue2 = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list2.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                            value: value, label: value);
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: List.generate(_imageFileList.length, (index) {
                final imageFile = _imageFileList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      imageFile == null
                          ? Text('Resim Seçilmedi')
                          : Image.file(
                              File(imageFile.path),
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                      SizedBox(height: 8),
                      Text(imageFile == null
                          ? ''
                          : imageFile.path.split('/').last),
                      ElevatedButton(
                        onPressed: () {
                          _removeImage(index);
                        },
                        child: Text('Sil'),
                      ),
                    ],
                  ),
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.gallery);
              },
              child: Text('Galeriden Resim Seç'),
            ),
            ElevatedButton(
              onPressed: () {
                _pickImage(ImageSource.camera);
              },
              child: Text('Kameradan Resim Çek'),
            ),
          ],
        ),
      ),
    );
  }
}
