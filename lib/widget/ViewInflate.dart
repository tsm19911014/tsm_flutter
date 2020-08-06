import 'dart:ui';

import 'package:flutter/material.dart';
/**
 *  text 既然作为一个没有child 的view  只有他的属性,
 *  那么在定义的他的时候就会写很多多余的代码,
 *  这种写法可以节省很多代码, 而且字体颜色和大小可以定义一些常量,
 *  但是在android 里面这些常量是可以写到配置文件里面,
 *  在flutter 中暂时还没有接触到,
 */

Text inflateText(String content, Color color, double size) => Text(
      content,
      style: TextStyle(color: color, fontSize: size),
    );

BottomNavigationBarItem inflateBottomNavBarItem(IconData iconData, String title) =>
    BottomNavigationBarItem(icon: Icon(iconData), title: Text(title));

PopupMenuItem<String> inflatePopuMenuItem(IconData icon, String text, String id) =>
    PopupMenuItem<String>(
        value: id,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Icon(icon, color: Colors.blue),
            new Text(text),
          ],
        ));
