import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

class TsmAnimatedBuilderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmAnimatedBuilderState();
}

class TextAnimatedWidget extends AnimatedWidget {
  TextAnimatedWidget({
    Key key,
    @required Animation<int> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Animation<int> animation = listenable;
    printString(animation.value);
    return Text(
      "上面图片Hero动画",
      style: TextStyle(
        color: Color.fromARGB(animation.value, 1, 1, 1),
      ),
    );
  }
}

class _TsmAnimatedBuilderState extends State<TsmAnimatedBuilderPage> with SingleTickerProviderStateMixin{

  AnimationController  _controller;
  Animation<int> _animation;
  @override
  void initState() {
    _controller=AnimationController(duration: Duration(seconds: 1,),vsync: this);
    _animation=IntTween(begin: 0,end: 255,)
        .animate(CurvedAnimation(parent: _controller,curve: Interval(0.2,0.8,curve: Curves.easeOut)));
    _controller.addStatusListener((status) {
      if(_controller.status==AnimationStatus.completed){
        _controller.reverse();
      }else if(_controller.status==AnimationStatus.dismissed){
        _controller.forward();
      }
    });
    _controller.forward();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation 学习"),
        centerTitle: true,
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context,child){
          return Container(
            child: child,
            color: Color.fromARGB(_animation.value, 255, 1, 1),
          );
        },
        child: Center(
          child: Text('渐变动画'),
        ),
      ),
    );
  }
}
