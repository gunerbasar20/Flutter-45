import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
    home: Premium(),
  ));
}
class Premium extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.brown,
      appBar: AppBar(
        title: Text('Bookit Premium Aboneliklerimiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: ListView(
        children: [
          _buildSubscriptionCard('Aylık Abonelik', '100 TL','',() {

          }),

          _buildSubscriptionCard('Yıllık Abonelik', '900 TL','300 TL İndirimli!',() {

          }),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(Baslik, fiyat, uyari ,abonebuton) {
    return Card(
      elevation: 3.0,
      child: InkWell(
        onTap: abonebuton,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Baslik,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                fiyat,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              Text(
                uyari,
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),

              ElevatedButton(
                onPressed:( abonebuton),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                child: Text('Aboneliği Satın Al'),
                

              ),
            ],
          ),
        ),
      ),
    );
  }
}



