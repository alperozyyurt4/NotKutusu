import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageCard extends StatefulWidget {
  const ImageCard({Key? key}) : super(key: key);

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
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

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
        title: Text('N O T L A R'),
      ),
      body: imageList.isEmpty
          ? CircularProgressIndicator()
          : ListView.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return ImageCardWidget(imageData: imageList[index]);
              },
            ),
    );
  }
}

class ImageCardWidget extends StatelessWidget {
  final ImageData imageData;

  const ImageCardWidget({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.network(
            imageData.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          ListTile(
            title: Text('Bölüm: ${imageData.section}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sınıf: ${imageData.grade}'),
                Text('Ders Kodu: ${imageData.courseCode}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageData {
  final String imageUrl;
  final String section;
  final String grade;
  final String courseCode;

  ImageData({
    required this.imageUrl,
    required this.section,
    required this.grade,
    required this.courseCode,
  });

  // Firestore'dan döküman okuma
  factory ImageData.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return ImageData(
      imageUrl: data['imageUrl'] ?? '',
      section: data['section'] ?? '',
      grade: data['grade'] ?? '',
      courseCode: data['courseCode'] ?? '',
    );
  }
}
