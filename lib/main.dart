import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/FirstPage.dart';
import 'package:flutter_app1/tsm_page/SecondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/tsm/first': (_)=>FirstPage(),
        '/tsm/second':(_)=>SecondPage(),
      },
      home: FirstPage(),
    );
  }
}
