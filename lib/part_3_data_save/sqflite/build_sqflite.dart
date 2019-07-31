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

sql() async{
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  var dbName = 'demo.db';
  String path ='$databasesPath/$dbName';
  // join(databasesPath, 'demo.db');

// Delete the database
  await deleteDatabase(path);

// open the database
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
      });

// Insert some records in a transaction
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
    print('inserted1: $id1');
    int id2 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
        ['another name', 12345678, 3.1416]);
    print('inserted2: $id2');
  });

// Update some record
  int count = await database.rawUpdate(
      'UPDATE Test SET name = ?, VALUE = ? WHERE name = ?',
      ['updated name', '9876', 'some name']);
  print('updated: $count');

// Get the records
  List<Map> list = await database.rawQuery('SELECT * FROM Test');
  List<Map> expectedList = [
    {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
    {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
  ];
  print(list);
  print(expectedList);
//  assert(const DeepCollectionEquality().equals(list, expectedList));
// Count the records
  count = Sqflite
      .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
  assert(count == 2);

// Delete a record
  count = await database
      .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
  assert(count == 1);
  Future<List<Map<String, dynamic>>> rawQuery = database.rawQuery('SELECT * FROM "table"');

// Close the database
  await database.close();

}