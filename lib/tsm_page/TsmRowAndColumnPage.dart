import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/widget/ViewInflate.dart';

class TsmRowAndColumnPage extends StatefulWidget {
  @override
  _TsmRowAndColumnState createState() => _TsmRowAndColumnState();
}

class _TsmRowAndColumnState extends State<TsmRowAndColumnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: inflateText('Row and Column', Colors.white, 16),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,///为了让Container 铺满屏幕
        ///
        /// Column  与 Row 的 交叉轴的宽度默认为所有子布局中最大的一个,
        child: Column(
          /// Column 为垂直的线性性布局   与 cross 相关的则为水平属性设置,
          /// 反之Row为水平线性布局,与 cross 相关的则为垂直属性设置,
          crossAxisAlignment: CrossAxisAlignment.center,
          /// 设置 主轴方向的高度,如果为 max 则填充满父布局,如果为min 则为所有子布局之和,
          /// 但是我这里使用了Expanded  伸缩控件 感觉好像min就失去了意义
          mainAxisSize: MainAxisSize.max,
          ///主轴的对齐方式
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded(///伸缩控件
              child: ColoredBox(
                color: Colors.purpleAccent,
                child: Center(
                  ///这里为了测试如果不给 Container 设置alignment 与 约束,
                  ///他的大小为 子控件的大小 即 warp_centent
                  child: Container(
                    child: inflateText('Row', Colors.black87, 15),
                    color: Colors.redAccent,
                  ),
                ),
              ),
              flex: 1,/// 权重比例
            ),
            Expanded(
              child: Text(
                'and',
                style: TextStyle(
                  color: Colors.black87,
                  background: Paint()..color = Colors.blueAccent, ///为text 这只背景色
                ),
              ),
              flex: 3,/// 权重比例
            ),
            Expanded(
              ///这里为了测试如果 Container 设置了alignment ,
              ///他的大小为填充满父布局 即 match_parent
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'Column',
                  style: TextStyle(
                    color: Colors.black87,
                    background: Paint()..color = Colors.blueAccent,
                  ),
                ),
                color: Colors.greenAccent,
              ),
              flex: 1,/// 权重比例
            ),
          ],
        ),
      ),
    );
  }
}
