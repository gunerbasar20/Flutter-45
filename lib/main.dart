import 'package:flutter/material.dart';
import 'SayfaA.dart';
import 'Premium.dart';

void main() => runApp(BookitApp());

class BookitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookit',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sayfaListesi = [SayfaA(), Premium()];
  int _selectedIndex = 1; // Start with 'Ana Sayfa' button selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.brown),
        title: Row(
          children: [
            Spacer(),
            Text(
              'bookit',
              style: TextStyle(
                color: Colors.brown, // Changed to brown
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Bildirim sayfasına yönlendir
            },
          ),
        ],
      ),
      body: _buildHomePage(context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.login, color: Colors.grey),
            label: 'Giriş Yap',


          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.grey),
            label: 'Premium',

          ),
        ],

        elevation: 0,
        selectedItemColor:Colors.brown[900],




        onTap: (index) {
          // Only update the index if the "Ana Sayfa" button is pressed
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SayfaA()));

            setState(() {
              _selectedIndex=index;
              });
          }
          if(index == 2){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>Premium()));

            setState(() {
              _selectedIndex=index;
            });

          }


          }

      ),
    );
  }

  Widget _buildHomePage(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Merhaba Beyza!\nNe okumak istiyorsun?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.brown, // Changed to brown
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Kitapları keşfet',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(label: Text('Tümü')),
                Chip(label: Text('Yeni')),
                Chip(label: Text('Bestseller')),
              ],
            ),
            SizedBox(height: 20),
            _buildSectionTitle(context, 'Popüler', _showPopularBooks),
            _buildBookList(
                context, ['Outsider', 'Hunger Games', 'Fortress Blood']),
            SizedBox(height: 20),
            _buildSectionTitle(context, 'Kurgu', _showFictionBooks),
            _buildBookList(
                context, ['Artemis', 'Harry Potter', 'Yüzüklerin Efendisi']),
          ],
        ),
      ),
    );
  }

  void _showPopularBooks() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BookListPage(title: 'Popüler Kitaplar', books: [
                'Outsider',
                'Hunger Games',
                'Fortress Blood',
                '1984',
                'Hayvan Çiftliği',
                'Alışkanlıkların Gücü',
                'İnsanları Etkileme Sanatı',
                'Dune'
              ])),
    );
  }

  void _showFictionBooks() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => BookListPage(title: 'Kurgu Kitaplar', books: [
                'Artemis',
                'Harry Potter',
                'Yüzüklerin Efendisi',
                'Dönüşüm',
                'Kayıp Zamanın İzinde',
                'Amerikan Tanrıları',
                'Kralların Yolu',
                'Elantris'
              ])),
    );
  }

  Widget _buildSectionTitle(
      BuildContext context, String title, Function onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: () => onTap(),
          child: Text('Hepsini gör'),
        ),
      ],
    );
  }

  Widget _buildBookList(BuildContext context, List<String> books) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(books[index]),
                  content: Text('Daha fazlası için hemen üye ol.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Kapat'),
                    ),
                  ],
                ),
              );
            },
            child: Container(
              width: 100,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(
                      'assets/${books[index].toLowerCase().replaceAll(' ', '_')}.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.black54,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      books[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BookListPage extends StatelessWidget {
  final String title;
  final List<String> books;

  BookListPage({required this.title, required this.books});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.brown),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(books[index]),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(books[index]),
                  content: Text('Daha fazlası için hemen üye ol.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Kapat'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
