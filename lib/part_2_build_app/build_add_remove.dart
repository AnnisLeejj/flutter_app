import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppAddRemove extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'ChangeView',
      theme: new ThemeData(
        primaryColor: Colors.red,
//        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  @override
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  int flag = 0;

  _changeValue() {
    setState(() {
      flag++;
    });
  }

  _getToggleChild() {
    switch (flag % 3) {
      case 0:
        return new Text('TextView');
      case 1:
        return new MaterialButton(
          child: new Text('Toggle Two'),
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Button checked!",
                timeInSecForIos: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16);
          },
        );
      case 2:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sample Title'),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _changeValue,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),
    );
  }
}
