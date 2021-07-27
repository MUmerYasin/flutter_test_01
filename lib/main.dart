import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,

            children: <Widget>[

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Flutter Spinkit"),


                  ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   SpinKitCircle(
                     color: Colors.pink,
                   ),
                  SpinKitChasingDots(
                    color: Colors.pink,
                    size: 40,
                  ),
                  SpinKitPumpingHeart(
                    color: Colors.redAccent,
                    size: 50,
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("font_awesome_flutter: 9.1.0"),
                  ),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                 
                  Icon(FontAwesomeIcons.uncharted,color: Colors.amber, size: 50,),

                  FaIcon(FontAwesomeIcons.airbnb, color: Colors.amber, size: 50,),
                  FaIcon(FontAwesomeIcons.facebook, color: Colors.amber, size: 50,),
                  FaIcon(FontAwesomeIcons.whatsappSquare, color: Colors.amber, size: 50,),


                  // onPressed: () { print("Pressed"); }

                      // IconButton(
                      // icon: FaIcon(FontAwesomeIcons.search),
                      // onPressed: () {
                      //   },
                      // ),


                ],
              ),

            ],
          ),
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
