




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class TsmStickHeaderPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('粘性头部ListView'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 12,
          itemBuilder: (context, index) {
            return StickyHeader(
              header: Container( //header组件
                height: 50.0,
                color: Colors.blueGrey[700],
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Text('Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              content: Container(//内容组件
                child: Image.asset('images/bg_baby_handbook_en.png', fit: BoxFit.cover,width: double.infinity, height: 200.0),
              ),
            );
          }
      ),
    );
  }

}