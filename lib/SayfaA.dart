import 'package:bookit/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( SayfaA());
}

class SayfaA extends StatelessWidget {
  const SayfaA({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bookit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:MyHomePage(title: "Bookit",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor:Colors.brown[200],

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text("Giriş Yap",style: TextStyle(
              color: Colors.brown,
              fontSize: 35,
              fontWeight:FontWeight.bold,
            ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText:"Kullanıcı Adı",hintStyle: TextStyle(
                    color: Colors.brown[800],
                    fontSize: 18
                )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                obscureText: true,
                style: TextStyle(color:Colors.blue,fontSize: 20),
                decoration: InputDecoration(
                    hintText:"Şifre Giriniz",hintStyle: TextStyle(
                    color: Colors.brown[800],
                    fontSize: 18
                )
                ),
              ),
            ),
            Text("Şifremi Unuttum?",textAlign:TextAlign.center),

            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookitApp()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown[50],
                    ),
                    child:Text("Giriş Yap",style: TextStyle(
                        color:Colors.brown[900]
                    ),
                    )
                ),
              ),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
