import 'package:flutter/material.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(seconds: 10), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(primarySwatch: Colors.blue,),
        home: MyHomePage(title: 'Product layout demo home page', animation: animation,)
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
class MyHomePage extends StatelessWidget {
  MyHomePage({Key ? key, required this.title, required this.animation}): super(key: key);
  final String title;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Listing")),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: <Widget>[
            FadeTransition(
                child: FootballPlayer(
                    name: "Lionel Messi",
                    club: "PSG",
                    age: 35,
                    image: "messi.jpg"
                ),
                opacity: animation
            ),
            MyAnimatedWidget(
                child: FootballPlayer(
                    name: "Kevin De Bruyne",
                    club: "Manchester City",
                    age: 31,
                    image: "debruyne.jpg"
                ),
                animation: animation
            ),
            FootballPlayer(
                name: "Marco Verratti",
                club: "PSG",
                age: 30,
                image: "verratti.jpg"
            ),
            FootballPlayer(
                name: "Mason Mount",
                club: "Chelsea",
                age: 23,
                image: "masonmount.jpg"
            ),
            FootballPlayer(
                name: "Phil Foden",
                club: "Manchester City",
                age: 22,
                image: "foden.jpg"
            ),
            FootballPlayer(
                name: "Frankie De Jong",
                club: "Barcelona",
                age: 25,
                image: "dejong.jpeg"
            ),
          ],
        )
    );
  }
}
class FootballPlayer extends StatelessWidget {
  FootballPlayer({Key ? key, required this.name, required this.club, required this.age, required this.image}) :
        super(key: key);
  final String name;
  final String club;
  final int age;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("assets/" + image, fit: BoxFit.fill, width: 130, height: 110,),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                  this.name, style: TextStyle(
                                  fontWeight: FontWeight.bold
                              )
                              ),
                              Text(this.club), Text(
                                  "Price: " + this.age.toString()
                              ),
                            ],
                          )
                      )
                  )
                ]
            )
        )
    );
  }
}
class MyAnimatedWidget extends StatelessWidget {
  MyAnimatedWidget({required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          child: Opacity(opacity: animation.value, child: child),
        ),
        child: child
    ),
  );
}