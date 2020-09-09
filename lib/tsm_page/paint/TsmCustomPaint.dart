import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TsmCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {


    double itemWidth=10;

    double offset=itemWidth/2;

    int width = (size.width-offset*2)  ~/ itemWidth;
    int height = (size.height -offset*2) ~/ itemWidth;
    Paint paint = Paint();
    paint
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.redAccent;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);


    paint..color=Colors.white
    ..strokeWidth=1;


    for(int i=0;i<(width+1);i++){
      double w=offset+i*itemWidth;
      canvas.drawLine(Offset(w,offset), Offset(w,size.height-offset), paint);
    }

    for(int i=0;i<(height+1);i++){
      double h=offset+itemWidth*i;
      canvas.drawLine(Offset(offset,h), Offset(size.width-offset,h), paint);
    }


    paint..color=Colors.blueAccent
    ..style=PaintingStyle.stroke;



    var rrect =RRect.fromLTRBAndCorners(50, 70, 130, 100,topLeft: Radius.elliptical(20, 40),topRight: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10));
    canvas.drawRRect(rrect, paint);




  }

  /**
   * 是否需要重新绘制,这个看情况,如果比较复杂,就需要根据实际情况判断了,
   * 如果比较简单,可以返回true
   */
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
