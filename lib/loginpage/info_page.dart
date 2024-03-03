import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appBarUygulamaHakkinda = "Uygulama Hakkında";

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          appBarUygulamaHakkinda,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),

        //* List view
        child: InfoMessages(),
      ),
    );
  }
}

class InfoMessages extends StatelessWidget {
  const InfoMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10); // Her kart arasında 10 birimlik boşluk
      },
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          // İlk kart: Başlık
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  AppbarText(text: 'Not Kutusu', fontSize: 24),
                  AppbarText(text: 'Ders Notlarınızı Kolayca Yönetin', fontSize: 20),
                ],
              ),
            ),
          );
        } else {
          // Diğer kartlar: Maddeler
          return Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '$index. Derslerinizi kaydedin ve ders adı, dönemi ve öğretmeni gibi bilgileri tutun.',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          );
        }
      },
    );
  }
}

class AppbarText extends StatelessWidget {
  const AppbarText({super.key, required this.fontSize, required this.text});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold));
  }
}
