import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_test_01/formTestings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'card_Testing.dart';

void main() {
  runApp(MyApp3());
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

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

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
                  Icon(
                    FontAwesomeIcons.uncharted,
                    color: Colors.amber,
                    size: 50,
                  ),
                  FaIcon(
                    FontAwesomeIcons.airbnb,
                    color: Colors.amber,
                    size: 50,
                  ),
                  FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue[900],
                    size: 50,
                  ),
                  FaIcon(
                    FontAwesomeIcons.whatsappSquare,
                    color: Colors.green[900],
                    size: 50,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Text("share: 2.0.4")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: myController,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Enter Your Name'),
                    ),
                  ),
                  Expanded(
                      child: OutlinedButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {
                      String myContValue = myController.text;
                      if (myContValue.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the that user has entered by using the
                              // TextEditingController.
                              content: Text("Empty Field"),
                            );
                          },
                        );
                      } else {
                        Share.share(myContValue);
                      }
                    },
                    child: Text('Share'),
                  ))
                ],

                // Share.share('check out my website https://example.com', subject: 'Look what I made!');
              ),
              Row(
                children: [],
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
