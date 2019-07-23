import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

String gif =
    'https://github.com/flutter/plugins/raw/master/packages/video_player/doc/demo_ipod.gif?raw=true';
String jpg =
    'https://ss1.bdstatic.com/5aAHeD3nKgcUp2HgoI7O1ygwehsv/media/ch1/jpg/%E5%A4%8F%E8%87%B3%E9%80%9A%E6%A0%8Fpc.jpg';

class MyAppImageHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Fade in images';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Stack(
          children: <Widget>[
            new Center(child: new CircularProgressIndicator()),
            new Center(
              child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage, image: jpg),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appName = 'Custom Themes';

    return new MaterialApp(
      title: appName,
      theme: new ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.green,
      ),
      home: new MyHomePage(
        title: appName,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Container(
          color: Theme.of(context).accentColor,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
//              new Image.network(
//                'https://ss1.bdstatic.com/5aAHeD3nKgcUp2HgoI7O1ygwehsv/media/ch1/jpg/%E5%A4%8F%E8%87%B3%E9%80%9A%E6%A0%8Fpc.jpg',
//              ),
              new Image.network(gif)
            ],
          ),
        ),
      ),
      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.black),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}
