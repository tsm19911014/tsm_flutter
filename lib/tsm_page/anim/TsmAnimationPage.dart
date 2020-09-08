import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

class TsmAnimationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmAnimationState();
}

class _TsmAnimationState extends State<TsmAnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<int> animation;
  AnimationController animatedContainer;

  @override
  void initState() {
    animatedContainer = AnimationController(
        duration: Duration(seconds: 2),
        lowerBound: 0,
        upperBound: 1,
        vsync: this);

    ///改变起始值
    Animation curve =
        CurvedAnimation(parent: animatedContainer, curve: Curves.easeIn);

    ///添加变速模型
    animation = IntTween(begin: 0, end: 255).animate(curve);

    ///改变起始值
    animatedContainer.addListener(() {
      setState(() {
        printString("value:${animation.value}");
      });
    });
    animatedContainer.addStatusListener((status) {
      if(status==AnimationStatus.completed){
        animatedContainer.reverse();
      }else if(status==AnimationStatus.dismissed){
        animatedContainer.forward();
      }
    });
    animatedContainer.forward();
    super.initState();
  }

  @override
  void dispose() {
    animatedContainer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 学习"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text(
            "上面图片Hero动画",
            style: TextStyle(
              color: Color.fromARGB(animation.value, 1, 1, 1),
            ),
          ),
        ),
      ),
    );
  }
}
