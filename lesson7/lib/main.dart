import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Football players information'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        shrinkWrap: true, padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
        children: <Widget>[
          FootballPlayer(
            name: "Lionel Messi",
            age: 35,
            club: "Paris-Saint Germain",
            image: "messi.jpg",
          ),
          FootballPlayer(
            name: "Marco Verratti",
            age: 30,
            club: "Paris-Saint Germain",
            image: "verratti.jpg",
          ),
          FootballPlayer(
            name: "Kevin De Bruyne",
            age: 31,
            club: "Manchester City",
            image: "debruyne.jpg",
          ),
          FootballPlayer(
            name: "Frankie De Jong",
            age: 25,
            club: "Barcelona",
            image: "dejong.jpeg",
          ),
          FootballPlayer(
            name: "Mason Mount",
            age: 23,
            club: "Chelsea",
            image: "masonmount.jpg",
          ),
          FootballPlayer(
            name: "Phil Foden",
            age: 22,
            club: "Manchester City",
            image: "foden.jpg",
          ),
        ],
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FootballPlayer extends StatelessWidget{
  FootballPlayer({Key? key, required this.name, required this.club, required this.age, required this.image}) : super(key: key);

  final String name;
  final String club;
  final int age;
  final String image;

  Widget build(BuildContext){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0), height: 100,
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
          Image.asset("assets/" +image, fit: BoxFit.fill, width: 150,), Expanded(
              child: Container(
                  padding: EdgeInsets.all(5), child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)), Text(this.club),
                    Text("Age: " + this.age.toString()),
                ],
              )
              )
          )
        ]

        ),
      ),
    );
  }
}
