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
      home: MyHomePage(title: 'Football players information'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  final players = [Player('Lionel Messi', 35, 'PSG', 'messi.jpg', 5), Player('Kevin De Bruyne', 31, 'Manchester City', "debruyne.jpg", 5), Player('Mason Mount', 23, 'Chelsea', 'masonmount.jpg', 4), Player('Marco Verratti', 30, 'PSG', 'verratti.jpg', 4), Player('Phil Foden', 22, 'Manchester City', 'foden.jpg', 4)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return FootballPlayer(player: players[index]);
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FootballPlayer extends StatelessWidget{
  FootballPlayer({Key? key, required this.player}) : super(key: key);

  final Player player;

  Widget build(BuildContext context){
    return ScopedModel(
      model: player,
      child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("assets/" +this.player.image, fit: BoxFit.fill, width: 130, height: 100,),
              Expanded(
                  child: Container(
                    // padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.player.name, style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.player.club),
                          Text("Age: " + this.player.age.toString()),
                          //RatingBox(item: item)
                          ScopedModelDescendant<Player>(builder: (context, child, model) {
                            return RatingBox(player: model);
                          }),
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

class Player extends Model {
  final String name;
  final int age;
  final String club;
  final String image;
  int rating;

  Player(this.name, this.age, this.club, this.image, this.rating);
  factory Player.fromMap(Map<String, dynamic> json) {
    return Player(
      json['name'],
      json['age'],
      json['club'],
      json['image'],
      json['rating'],
    );
  }
  void setRating(newRating) {
    rating = newRating;
    notifyListeners();
  }
}

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key, required this.player}) : super(key: key);
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [1, 2, 3, 4, 5].map(
          (i) => IconButton(
            onPressed: () {
              ScopedModel.of<Player>(context).setRating(i);
            },
            icon: this.player.rating >= i ? const Icon(Icons.star) : const Icon(Icons.star_border),
            color: Colors.amber,
        ),
      ).toList(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}




