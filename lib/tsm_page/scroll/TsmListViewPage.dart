import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmListViewPage();
}

class _TsmListViewPage extends State<TsmListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView 学习'),
        centerTitle: true,
      ),
    );
  }
}
