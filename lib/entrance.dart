import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/part_1/_1_theme.dart';
import 'package:flutter_app/part_1/_2_image.dart';
import 'package:flutter_app/part_1/_3_list.dart';
import 'package:flutter_app/part_1/_4_toutch.dart';
import 'package:flutter_app/part_1/_5_navigator.dart';
import 'package:flutter_app/part_1/_6_network.dart';
import 'package:flutter_app/part_2_build_app/build_main.dart';
import 'myLib.dart';
import 'part_2_build_app/build_state.dart';

/*********  part_1  **************/
//void main() => runApp(new MyApp());
//void main() => runApp(getListView());
//void main() => runApp(getTouchView());
//void main() => runApp(getNavigator());
//void main() => runApp(getNetWork());

//void main() {
//  runApp(new MaterialApp(
//    title: 'My app', // used by the OS task switcher
//    home: new AppImageNetCache()//MyAppImageHolder()//MyAppImage()//MyAppTheme()//TutorialHome(),//MyScaffold(),
//  ));
//}

/*********  part_2  **************/
void main() => runApp(getAppLayout());
