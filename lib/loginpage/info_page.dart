import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String appBarUygulamaHakkinda = "Uygulama Hakkında";

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          appBarUygulamaHakkinda,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView.separated(
          itemCount: 6,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10); // Her kart arasında 10 birimlik boşluk
          },
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              // İlk kart: Başlık
              return Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Not Kutusu',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Ders Notlarınızı Kolayca Yönetin',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
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
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    '${index}. Derslerinizi kaydedin ve ders adı, dönemi ve öğretmeni gibi bilgileri tutun.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
