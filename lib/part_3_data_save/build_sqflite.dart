import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'sqflite_config.dart';

//api https://pub.dev/packages/sqflite

void main() {
  runApp(
    new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.yellow,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Sqflite learn'),
        ),
        body: new Center(
            child: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: _incrementCounter,
              child: new Text('Increment Counter'),
            ),
            new RaisedButton(
              onPressed: () {
                _getDb('lee.db');
              },
              child: new Text('getDb'),
            ),
          ],
        )),
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

Future<Database> _getDb(String dbName) async {
//  return await openDatabase('my_db.db');

  var databasesPath = await getDatabasesPath();
  databasesPath = '$databasesPath/$dbName';
  print('databasesPath:$databasesPath');
  var db = await openDatabase(databasesPath, version: 1, onCreate: _onCreate);
}

_onCreate(Database db, int version) async {
  // Database is created, create the table
  await db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, value TEXT)");
}

_closeDb(Database db) async {
  await db.close();
}
