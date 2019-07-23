import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/_1_theme.dart';
import 'package:flutter_app/_2_image.dart';
import 'myLib.dart';

//void main() => runApp(new MyApp());

void main() {
  runApp(new MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: new MyAppImageHolder()//MyAppImage()//MyAppTheme()//TutorialHome(),//MyScaffold(),
  ));
}

//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();  // 删除此行
//
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          //child: new Text(wordPair.asPascalCase),
//          child: new RandomWords(),
//        ),
//      ),
//    );
//  }
//}