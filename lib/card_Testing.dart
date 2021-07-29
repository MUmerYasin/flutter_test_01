/// Flutter code sample for Card
import 'package:flutter/material.dart';

/// This is the main application widget.
class MyApp3 extends StatelessWidget {
  const MyApp3({Key? key}) : super(key: key);

  static const String _title = 'Flutter Card';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('The Enchanted Nightingale'),
                  subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('LISTEN'),
                      onPressed: () {/* ... */},
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Tap on Card')),
                      );
              },

              child: Center(
                child: const SizedBox(
                  width: 300,
                  height: 100,
                  child: Text('A card that can be tapped'),
                ),
              ),



            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(

            color: Colors.black,
            shadowColor: Colors.amber,
            elevation: 16,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                     width:500.0,
                     height: 10,
                 ),
                 Text('Card with Change', style: TextStyle(color: Colors.white,),),

                 TextButton(onPressed: (){
                   ScaffoldMessenger.of(context).showSnackBar(
                     const SnackBar(content: Text('Nothing to Learn More')),
                   );
                 }, child: Text('Learn More'),),
               ],
             ),

          ),
        ),

      ],
    );
  }
}
