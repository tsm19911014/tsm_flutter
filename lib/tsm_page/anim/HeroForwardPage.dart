


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroForwardPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('原图'),
        centerTitle: true,
      ),
      body: Center(
        child: Hero(
          tag: 'tsm_tag',
          child: Image.asset(
            'images/bg_baby_handbook_en.png',
            fit: BoxFit.contain,
            width: double.infinity,
          ),
        ),
      ),
    );
  }
}
