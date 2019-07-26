import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

//api https://pub.dev/packages/sqflite
void main() {
  runApp(
    new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new RaisedButton(
            onPressed: _incrementCounter,
            child: new Text('Increment Counter'),
          ),
        ),
      ),
    ),
  );
}

_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  prefs.setInt('counter', counter);
}

_getDb() async {
  var db = await openDatabase('my_db.db');
}
