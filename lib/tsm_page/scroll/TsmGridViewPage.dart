import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmGridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUrl =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597401825695&di=61550fe4527da207c8d3f549216c530c&imgtype=0&src=http%3A%2F%2Fa0.att.hudong.com%2F56%2F12%2F01300000164151121576126282411.jpg";

    var imageUrl2 =
        "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1597401825695&di=35a7be9c265d3a00edc13ed2e0119b5d&imgtype=0&src=http%3A%2F%2Fa1.att.hudong.com%2F05%2F00%2F01300000194285122188000535877.jpg";

    return Scaffold(
      appBar: AppBar(
        title: Text('GridView 学习'),
        centerTitle: true,
      ),
      body: Scrollbar(
        ///  GridView
        ///  快速构造方法有3个,
        ///  1. GridView.count();
        ///  方法使用的是 SliverGridDelegateWithFixedCrossAxisCount 横轴为固定数量子元素
        ///  子条目为多个  children : =>  <Widget>[]  ,
        ///  不是动态加载,一次性全部充起
        ///  2. GridView.extent()
        ///  方法使用的是SliverGridDelegateWithMaxCrossAxisExtent  轴子元素为固定最大长度
        ///  子条目为多个  children : =>  <Widget>[] ,
        ///  不是动态加载,一次性全部充起
        ///
        ///  3. GridView.build()
        ///  两个必要参数   gridDelegate  itemBuilder
        ///  如果不指定itemCount  则无限多
        ///  基于Sliver 动态加载布局,
        ///
        child: GridView.builder(
          /// SliverGridDelegateWithFixedCrossAxisCount 横轴为固定数量子元素
          ///   1. crossAxisCount 交叉轴个数为3个
          ///   2. childAspectRatio 交叉轴与主轴比,由于交叉轴个数设定后,主轴的高度就能计算了
          ///   3. crossAxisSpacing  交叉轴之间的距离
          ///   4. mainAxisSpacing  主轴元素之间的距离
          ///
          ///
          /// SliverGridDelegateWithMaxCrossAxisExtent  轴子元素为固定最大长度
          ///   1. maxCrossAxisExtent 交叉轴最大长度
          ///
          ///    举个例子,  如果viewport 即 窗口宽度为100
          ///
          ///     如果设置他的   33< maxCrossAxisExtent <50  则横有2个 条目
          ///     如果小于 25<maxCrossAxisExtent <33  则有3个 条目
          ///
          ///
          ///
          ///
//            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 3, childAspectRatio: 1.413),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 1.41,
          ),

          itemCount: 51,
          itemBuilder: (context, index) => Image(
            image: NetworkImage(index % 2 == 0 ? imageUrl : imageUrl2),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
