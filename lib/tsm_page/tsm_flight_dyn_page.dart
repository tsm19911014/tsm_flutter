import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/widget/ViewInflate.dart';

class TsmFlightDynPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmFlightDynState();
}

class _TsmFlightDynState extends State<TsmFlightDynPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('模仿国航航班动态'),
        centerTitle: true,
      ),
      body:ColoredBox(///设置背景颜色
        color: Color.fromARGB(255, 244, 245, 247),
        child: SizedBox(///让背景填充整个屏幕
          height: double.infinity,
          width: double.infinity,
          child: Scrollbar(///滑动距离
            child: Padding(//
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: SingleChildScrollView(///嵌套滑动布局
                physics: BouncingScrollPhysics(),///越界回弹效果
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    _getFirstWiget(),
                    SizedBox(
                      height: 10,
                    ),
                    _getFirstWiget(),
                    SizedBox(
                      height: 10,
                    ),
                    _getFirstWiget(),
                    SizedBox(
                      height: 10,
                    ),
                    _getFirstWiget(),
                    SizedBox(
                      height: 10,
                    ),
                    _getFirstWiget(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
            ),
          ),
        ),
      ),
  );
}

_getFirstWiget() => SizedBox(
      ///先设置圆角背景
      width: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              _getFirstChild(14, Colors.black87, '北京首都国际机场 T3', '上海虹桥机场 T1'),
              SizedBox(
                height: 10,
              ),
              _getFirstChild(12, Colors.black38, '实际起飞', '预计到达'),
              SizedBox(
                height: 5,
              ),
              _getTimeLine(),
              SizedBox(
                height: 5,
              ),
              _getFirstChild(
                  12, Colors.black38, '计划 12-10 20:00', '计划 12-11 01:21'),
              SizedBox(
                height: 15,
              ),
              _getWeather(),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              _getService(),
              SizedBox(
                height: 15,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              _getPreFlight(),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );

_getPreFlight() => Row(
      children: <Widget>[
        inflateText('前序航班', Colors.black54, 14),
        SizedBox(
          width: 7,
        ),
        Text(
          'CA987',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
        ),
        Text(
          '(北京-上海)',
          style: TextStyle(fontSize: 14, color: Colors.black54),
        ),
        Expanded(
          flex: 1,
          child: Text(
            '已到达',
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.greenAccent, fontSize: 14),
          ),
        ),
        SizedBox(
          width: 3,
        ),
        Image(
          image: AssetImage('images/arrow.png'),
          fit: BoxFit.contain,
          width: 4,
        )
      ],
    );

_getService() => Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: _getServiceItem('值机柜台', 'J', '8-12号门'),
        ),
        Expanded(
          flex: 1,
          child: _getServiceItem('登机口', 'C07', '靠廊桥'),
        ),
        SizedBox(
          width: 5,
          height: 50,
          child: VerticalDivider(),
        ),
        Expanded(
          flex: 1,
          child: _getServiceItem('行李转盘', '待定', ''),
        ),
        Expanded(
          flex: 1,
          child: _getServiceItem('到达口', 'B09', ''),
        ),
      ],
    );

_getServiceItem(String title1, String title2, String title3) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title1,
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title2,
          style: TextStyle(
              color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          title3,
          style: TextStyle(color: Colors.black38, fontSize: 12),
        )
      ],
    );

_getWeather() => Row(
      children: <Widget>[
        Image(
          image: AssetImage('images/sunny.png'),
          fit: BoxFit.contain,
          width: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text('晴'), Text('23-27°C')],
        ),
        Expanded(
          child: SizedBox(),
          flex: 1,
        ),
        Image(
          image: AssetImage('images/stormywind.png'),
          fit: BoxFit.contain,
          width: 18,
        ),
        SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Text('晴'), Text('15-20°C')],
        ),
      ],
    );

_getFirstChild(double size, Color color, String content1, String content2) =>
    Row(
      children: <Widget>[
        Expanded(
          child: inflateText(content1, color, size),
          flex: 1,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            content2,
            style: TextStyle(color: color, fontSize: size),
            textDirection: TextDirection.rtl,
          ),
          flex: 1,
        )
      ],
    );

_getTimeLine() => Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '20:20',
          style: TextStyle(
              color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '当地\n10日',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(
          width: 55,
        ),
        Expanded(
          child: SizedBox(
            child: Image(
              image: AssetImage('images/icon_jiantou.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          flex: 1,
        ),
        SizedBox(
          width: 55,
        ),
        Text(
          '当地\n11日',
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          '01:20',
          style: TextStyle(
              color: Colors.black87, fontSize: 25, fontWeight: FontWeight.w900),
        ),
      ],
    );
