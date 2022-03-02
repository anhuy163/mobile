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
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0), height: 110,
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("assets/" +image, fit: BoxFit.fill, width: 130, height: 110,),
              Expanded(
                  child: Center(
                    // padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.club),
                          Text("Age: " + this.age.toString()),
                          RatingBox()
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

class RatingBox extends StatefulWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox>{
  int rating = 0;

  // void setRatingAsOne(){
  //   setState(() {
  //     rating = 1;
  //   });
  // }
  // void setRatingAsTwo(){
  //   setState(() {
  //     rating = 2;
  //   });
  // }
  // void setRatingAsThree(){
  //   setState(() {
  //     rating = 3;
  //   });
  // }
  // void setRatingAsFour(){
  //   setState(() {
  //     rating = 4;
  //   });
  // }
  // void setRatingAsFive(){
  //   setState(() {
  //     rating = 5;
  //   });
  // }
  Widget build(BuildContext context){
    // int rating = 0;
    //double _size = 10;
    //print(rating);
    return Center(
      child: Row(
        children: [1, 2, 3, 4, 5]
            .map(
              (i) => IconButton(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            onPressed: () {
              setState(() {
                rating = i;
              });
            },
            icon: rating >= i
                ? const Icon(Icons.star, size: 20,)
                : const Icon(Icons.star_border, size: 20,),
            color: Colors.pink,
          ),
        )
            .toList(),
      ),
    );
    // return Row(
    //   // mainAxisAlignment: MainAxisAlignment.end,
    //   // crossAxisAlignment: CrossAxisAlignment.end,
    //   // mainAxisSize: MainAxisSize.max,
    //   children: <Widget>[
    //     Container(
    //       padding: EdgeInsets.all(0),
    //       child: IconButton(
    //         icon: (rating >= 1 ? Icon(Icons.star, size: _size,) :
    //         Icon(Icons.star_border, size: _size,)),
    //         color: Colors.red[500],
    //         onPressed: setRatingAsOne,
    //         iconSize: _size,
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(0),
    //       child: IconButton(
    //         icon: (rating >= 2 ? Icon(Icons.star, size: _size,) :
    //         Icon(Icons.star_border, size: _size,)),
    //         color: Colors.red[500],
    //         onPressed: setRatingAsTwo,
    //         iconSize: _size,
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(0),
    //       child: IconButton(
    //         icon: (rating >= 3 ? Icon(Icons.star, size: _size,) :
    //         Icon(Icons.star_border, size: _size,)),
    //         color: Colors.red[500],
    //         onPressed: setRatingAsThree,
    //         iconSize: _size,
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(0),
    //       child: IconButton(
    //         icon: (rating >= 4 ? Icon(Icons.star, size: _size,) :
    //         Icon(Icons.star_border, size: _size,)),
    //         color: Colors.red[500],
    //         onPressed: setRatingAsFour,
    //         iconSize: _size,
    //       ),
    //     ),
    //     Container(
    //       padding: EdgeInsets.all(0),
    //       child: IconButton(
    //         icon: (rating >= 5 ? Icon(Icons.star, size: _size,) :
    //         Icon(Icons.star_border, size: _size,)),
    //         color: Colors.red[500],
    //         onPressed: setRatingAsFive,
    //         iconSize: _size,
    //       ),
    //     ),
    //   ],
    // );

  }
}
