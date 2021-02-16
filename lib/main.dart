import 'package:flutter/material.dart';
import 'package:sembast_tutorial/home_page.dart';
import 'package:sembast_tutorial/init.dart';

void main() => runApp(JsonStringMapApp());

class JsonStringMapApp extends StatefulWidget {
  @override
  _JsonStringMapAppState createState() => _JsonStringMapAppState();
}

class _JsonStringMapAppState extends State<JsonStringMapApp> {
  final Future _init =  Init.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Favorite JsonStringMaps',
      home: FutureBuilder(
        future: _init,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return HomePage();
          } else {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

