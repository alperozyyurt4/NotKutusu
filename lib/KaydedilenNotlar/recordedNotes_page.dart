import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notkutusu/KaydedilenNotlar/recordedNotes_widget.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({super.key});

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  List<ImageData> imageList = [];

  @override
  void initState() {
    super.initState();
    loadImagesFromFirestore();
  }

  Future<void> loadImagesFromFirestore() async {
    try {
      // Firestore'dan verileri çekme
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('users').get();

      List<ImageData> images = querySnapshot.docs.map((doc) {
        return ImageData.fromFirestore(doc);
      }).toList();

      setState(() {
        imageList = images;
      });
    } catch (e) {
      print('Veri çekme hatası: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('N O T L A R'),
      ),
      body: imageList.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return ImageCardWidget(imageData: imageList[index]);
              },
            ),
    );
  }
}
