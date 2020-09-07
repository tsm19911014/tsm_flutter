import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../anim/HeroForwardPage.dart';

class TsmImagePage extends StatefulWidget {



  @override
  State<StatefulWidget> createState() => _TsmImagePageState();
}

class _TsmImagePageState extends State<TsmImagePage> {
  var networkImage=null;
  var imageUrl =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597401825695&di=61550fe4527da207c8d3f549216c530c&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F56%2F12%2F01300000164151121576126282411.jpg";

  var imageUrl2 =
      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597401825695&di=35a7be9c265d3a00edc13ed2e0119b5d&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F05%2F00%2F01300000194285122188000535877.jpg";



  @override
  void initState() {
    super.initState();
    networkImage=AssetImage('images/bg_baby_handbook_en.png');
  }



  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Image 学习'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: <Widget>[
              new Text('资源图片：'),
              new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Hero(
                      tag: 'tsm_tag',
                      child: new Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'images/bg_baby_handbook_en.png',
                          width: 100,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.push(context, PageRouteBuilder(
                          pageBuilder: (BuildContext context, Animation animation,
                              Animation secondaryAnimation) {
                            return new FadeTransition(
                              opacity: animation,
                              child:  HeroForwardPage(),
                            );
                          })
                      );
                    },
                  ),
                  Center(
                    child: Text('点我查看原图',style: TextStyle(color: Colors.black87),),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              new Text('网络占位图片FadeInImage：'),
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: new Row(
                  children: <Widget>[
                    new FadeInImage.assetNetwork(
                      placeholder:'images/bg_baby_handbook_en.png',
                      image: imageUrl,
                      width: 120,
                      fit: BoxFit.fitWidth,
                    ),
                    new Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: new FadeInImage.assetNetwork(
                        ///加载过程中的占位图
                        placeholder: 'images/bg_baby_handbook_en.png',
                        image: imageUrl,
                        width: 120,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              new Text('圆形圆角图片：'),
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ///圆形裁剪
                    new ClipOval(
                      child: Image.network(
                        imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: ClipOval(
                        child: Image.asset(
                          'images/bg_baby_handbook_en.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    ///方形裁剪
                    new ClipRRect(
                      child: Image.network(
                        imageUrl,
                        scale: 8.5,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    )
                  ],
                ),
              ),
              new Text('颜色混合图片：'),
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Image.asset(
                      'images/bg_baby_handbook_en.png',
                      color: Colors.red,
                      colorBlendMode: BlendMode.darken,
                      width: 100,
                    ),
                    new Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Image.network(
                        imageUrl,
                        scale: 8.5,
                        colorBlendMode: BlendMode.colorDodge,
                        color: Colors.blue,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
              new Text('centerSlice图片内部拉伸：'),
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: new Image.asset(
                  'images/bg_baby_handbook_en.png',
                  width: 400,
                  height: 600,
                  fit: BoxFit.contain,
                  centerSlice:new Rect.fromCircle(center: const Offset(20, 20), radius: 1),
                ),
              ),
              new Text('matchTextDirection图片内部方向'),
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Directionality(
                      textDirection: TextDirection.ltr,
                      child: Image.network(
                        imageUrl,
                        height: 100,
                        matchTextDirection: true,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Image.network(
                          imageUrl,
                          height: 100,
                          matchTextDirection: true,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Text('点击替换图片'),
              new Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: Row(
                  children: <Widget>[
                    new RaisedButton(
                      onPressed: () {
                        setState(() {
                          networkImage =
                          new NetworkImage(imageUrl2, scale: 8.5);
                        });
                      },
                      child: Text('点击更换图片'),
                    ),
                    new Image(
                      gaplessPlayback: false,
                      fit: BoxFit.contain,
                      image: networkImage,
                      width: 100,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
