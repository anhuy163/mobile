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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final imgPath = 'assets/messi.jpg';
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.title),
  //     ),
  //     body: Center(
  //         child: Column(
  //           // mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             GestureDetector(
  //               child: Image.asset(imgPath, width: 200, height: 200),
  //               onTap: () {
  //                 showDialog(
  //                     context: context,
  //                     builder: (context) {
  //                       return AlertDialog(
  //                         title: const Text('Info'),
  //                         content: Text(imgPath),
  //                         actions: <Widget>[
  //                           TextButton(
  //                             child: const Text("Close"),
  //                             onPressed: () {
  //                               Navigator.maybePop(context);
  //                             },
  //                           ),
  //                         ],
  //                       );
  //                     });
  //               },
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 const Icon(Icons.text_fields),
  //                 Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Text(
  //                     imgPath,
  //                     style: TextStyle(
  //                         fontWeight: FontWeight.w600,
  //                         color: Theme.of(context).primaryColor),
  //                   ),
  //                 )
  //               ],
  //             )
  //           ],
  //         )),
  //   );
  // }
  // void tapToShow(BuildContext context){
  //   showDialog(context: context, builder: (BuildContext){
  //     return AlertDialog(
  //       title: new Text("Message"),
  //       content: new Text("Hello An Huy"),
  //       actions: <Widget>[
  //         new FlatButton(onPressed: (){
  //           Navigator.of(context).pop();
  //         }, child: new Text("Close"))
  //       ],
  //     );
  //   });
  // }
  String msg = "Flutter xin chao";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // child: GestureDetector(
        //   onDoubleTap: () {
        //     showDialog(context: context, builder: (BuildContext){
        //       return AlertDialog(
        //         title: new Text("Message"),
        //         content: new Text("Hello An Huy"),
        //         actions: <Widget>[
        //           new FlatButton(onPressed: (){
        //             Navigator.of(context).pop();
        //           }, child: new Text("Close"))
        //         ],
        //       );
        //     });
        //   },
          child: Column(
            children: [
              FlatButton(color:Colors.pink,onPressed: (){
                showDialog(context: context, builder: (BuildContext){
                  return AlertDialog(
                    title: Text("Message"),
                    content: Text("Hello An Huy"),
                    actions: <Widget>[
                      new RaisedButton(color:Colors.blue ,onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Close"),)
                    ],
                  );
                });
              }, child: Text("Click to show"),),
              Text(msg, style: TextStyle(fontSize: 40, ),),
              RaisedButton(onPressed: (){
                setState(() {
                  if(msg.startsWith("F")){
                    msg = "Xin chao Ho An Huy";
                  }
                  else{
                    msg = "Flutter xin chao";
                  }
                });
              }, child: Text("Click to change msg"),
              color: Colors.blue,
              splashColor: Colors.green,)

              // Container(
              //   padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
              //   child: Text("Hello"),
              // )
            ],

          )
        //),
      )
    );
  }
  // _changeText() {
  //   setState(() {
  //     if (msg.startsWith('F')) {
  //       msg = 'We have learned FlutterRaised button example.';
  //     } else {
  //       msg = 'Flutter RaisedButton Example';
  //     }
  //   });
  // }
}
