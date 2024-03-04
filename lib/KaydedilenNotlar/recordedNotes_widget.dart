import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  final ImageData imageData;

  const ImageCardWidget({super.key, required this.imageData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => Dialog(
                  child: Image.network(imageData.imageUrl),
                ));
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
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
