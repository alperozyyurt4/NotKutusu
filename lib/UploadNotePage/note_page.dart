import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notkutusu/constant/color_utility.dart';
import 'package:notkutusu/constant/text_style.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> with ColorsUtility, AppBarTextStyle {
  String imageUrl = '';
  final List<XFile?> _imageFileList = [];
  String dropdownValue1 = '';
  String dropdownValue = '';
  String dropdownValue2 = '';

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    setState(() {
      _imageFileList.add(pickedFile);
    });
  }

  Future<void> _uploadImage() async {
    if (_imageFileList.isEmpty) {
      return; // Yüklenecek görsel yok
    }

    try {
      for (int i = 0; i < _imageFileList.length; i++) {
        if (_imageFileList[i] != null) {
          XFile selectedImage = _imageFileList[i]!;
          File imageFile = File(selectedImage.path);

          // Firebase Storage referansı
          Reference storageReference =
              FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}_$i.jpg');

          // Dosyayı Firebase Storage'a yükleyin
          await storageReference.putFile(imageFile);

          // Yüklenen görselin indirme URL'sini alın
          String downloadURL = await storageReference.getDownloadURL();

          setState(() {
            imageUrl = downloadURL;
          });

          // Firestore'a bölümü, sınıfı ve dersin kodunu ekleyin
          await _addNote(
            imageUrl,
            dropdownValue,
            dropdownValue1,
            dropdownValue2,
          );

          print('Görsel $i ve not bilgileri yüklendi. İndirme URL: $imageUrl');
        }
      }
    } catch (e) {
      print('Görsel yüklenirken hata oluştu: $e');
    }
  }

  Future<void> _addNote(
    String imageUrl,
    String section,
    String grade,
    String courseCode,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'imageUrl': imageUrl,
        'section': section,
        'grade': grade,
        'courseCode': courseCode,
      });
      print('Not başarıyla eklendi.');
    } catch (e) {
      print('Not eklenirken hata oluştu: $e');
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageFileList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height; //* Cihaz uygunluğu
    const double topMarginPercentage = 0.05; //* Üstten mesafe yüzde olarak ayarlanabilir

    const String appBarName = "N O T | E K L E";

    const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

    const List<String> list1 = <String>['1', '2', '3', '4'];

    const List<String> list2 = <String>['Enes', 'Adil', 'Alper', 'Gotik'];

    int number = 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('N O T | E K L E'),
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
                    const Text('Okuduğunuz bölümü seçiniz ?'),
                    DropdownMenu<String>(
                      width: 350,
                      initialSelection: list.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(value: value, label: value);
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
                    const Text('Okuduğunuz sınıfı seçiniz ?'),
                    DropdownMenu<String>(
                      width: 350,
                      initialSelection: list1.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue1 = value!;
                        });
                      },
                      dropdownMenuEntries: list1.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(value: value, label: value);
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
                    const Text('Dersin kodunu seçiniz ?'),
                    DropdownMenu<String>(
                      width: 350,
                      initialSelection: list2.first,
                      onSelected: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          dropdownValue2 = value!;
                        });
                      },
                      dropdownMenuEntries: list2.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(value: value, label: value);
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(_imageFileList.length, (index) {
                  final imageFile = _imageFileList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        if (imageFile != null)
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (_) => Dialog(
                                      child: Image.file(
                                        File(imageFile.path),
                                      ),
                                    ),
                                  );
                                },
                                child: Image.file(
                                  File(imageFile.path),
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  height: MediaQuery.of(context).size.height * 0.15,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // ignore: unnecessary_null_comparison
                              Text(imageFile == null ? '' : "${number++}. resim"),
                              IconButton(
                                onPressed: () {
                                  _removeImage(index);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    color: Colors.green,
                    iconSize: MediaQuery.of(context).size.height * 0.07,
                    onPressed: () {
                      _pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.photo),
                  ),
                  IconButton(
                    iconSize: MediaQuery.of(context).size.height * 0.07,
                    color: Colors.green,
                    onPressed: () {
                      _pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera_alt),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Kaydet'),
            ),
            ElevatedButton(
              onPressed: () {
                _uploadImage();
              },
              child: const Text('Resmi Yükle'),
            ),
          ],
        ),
      ),
    );
  }
}
