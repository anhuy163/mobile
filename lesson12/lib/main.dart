import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

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

  final players = [Player('Lionel Messi', 'PSG', 35, 'messi.jpg', 5), Player('Kevin De Bruyne', 'Manchester City', 31, 'debruyne.jpg', 5), Player('Marco Verratti', 'PSG', 30, 'verratti.jpg', 5), Player('Phil Foden', 'Manchester City', 22, 'foden.jpg', 4),
  Player('Mason Mount', 'Chelsea', 23, 'masonmount.jpg', 4), Player('Frankie De Jong', "Barcelona", 25, 'dejong.jpeg', 4)];

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
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: FootballPlayer(player: players[index]),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayerDetail(player: players[index])),);
            },
          );
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PlayerDetail extends StatelessWidget{
  PlayerDetail({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(this.player.name),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            children: <Widget>[
              Image.asset("assets/"+this.player.image),
              Container(
                padding: EdgeInsets.fromLTRB(80, 0, 20, 0),
                child: RatingBoxDetail(player: player,),
              ),

              RaisedButton(onPressed: (){
                Navigator.pop(context);
              },child: Text('Close'),)
            ],
          ),
        )
      ),
    );
  }
}

class FootballPlayer extends StatelessWidget{
  FootballPlayer({Key? key, required this.player}) : super(key: key);

  final Player player;

  Widget build(BuildContext){
    return ScopedModel(
      model: player,
      child: Container(
        height: 110,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset("assets/" +this.player.image, fit: BoxFit.fill, width: 130, height: 110,),
                Expanded(
                    child: Center(
                      // padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.player.name, style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(this.player.club),
                            Text("Age: " + this.player.age.toString()),
                            ScopedModelDescendant<Player>(builder: (context, child, model){
                              return RatingBox(player: model);
                            })
                          ],
                        )
                    )
                )
              ]
          ),
        ),
      )

    );
  }
}

class Player extends Model{
  final String name;
  final String club;
  final int age;
  final String image;
  int rating;
  Player(this.name, this.club, this.age, this.image, this.rating);
  factory Player.fromMap(Map<String, dynamic> json) {
    return Player(
      json['name'],
      json['age'],
      json['club'],
      json['image'],
      json['rating'],
    );
  }
  void setRating(int newRating){
    this.rating = newRating;
    notifyListeners();
  }
}

class RatingBoxDetail extends StatelessWidget{
  const RatingBoxDetail({Key?key, required this.player}):super(key: key);
  final Player player;

  @override
  Widget build(BuildContext context){
    return Container(
      child: Container(
        padding: EdgeInsets.only(left: 15),
        child: Row(
          children: [1, 2, 3, 4, 5].map((i) => this.player.rating >= i ?  Icon(Icons.star, size: 40, color: Colors.pink,) :  Icon(Icons.star_border, size:40, color: Colors.pink,),
          ).toList(),
        )
      ),
    );
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [1, 2, 3, 4, 5].map(
              (i) =>
              IconButton(padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                onPressed: () {
                  this.player.setRating(i);
                },
                icon: this.player.rating >= i ? const Icon(
                  Icons.star, size: 20,) : const Icon(
                  Icons.star_border, size: 20,),
                color: Colors.pink,
              ),
        ).toList(),
      ),
    );
  }
}
