import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Layout extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Row(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        new Text('Row One'),
//        new Text('Row Two'),
//        new Text('Row Three'),
//        new Text('Row Four'),
//      ],
//    );
//  }
//  @override
//  Widget build(BuildContext context) {
//    return new Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        new Text('Column One'),
//        new Text('Column Two'),
//        new Text('Column Three'),
//        new Text('Column Four'),
//      ],
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        new Text('Row One'),
        new Text('Row Two'),
        new Text('Row Three'),
        new Text('Row Four'),
      ],
    );
  }
}

//void main() {
//  runApp(new MaterialApp(
//      title: 'Layout',
//      theme: new ThemeData(
//        brightness: Brightness.dark,
//        primaryColor: Colors.lightBlue[800],
//        accentColor: Colors.green,
//      ),
//      home: new Layout()));
//}

void main() {
  runApp(new LogoApp());
}

class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      })
      ..addStatusListener((state) => Fluttertoast.showToast(msg: "$state"));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
//        height: 300,
//        width: 300,
          height: animation.value,
          width: animation.value,
          child: FlutterLogo(),
        ),
        onDoubleTap: () {},
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
