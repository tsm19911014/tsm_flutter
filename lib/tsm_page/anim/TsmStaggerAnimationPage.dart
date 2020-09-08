import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class StaggerRoute extends StatefulWidget {
  @override
  _StaggerRouteState createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        vsync: this
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  Future<Null> _playAnimation() async {
    try {
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("交织动画"),
        centerTitle: true,
      ),
      body: Container(
        color:Colors.white,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            _playAnimation();
          },
          child: Center(
            child: Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                border: Border.all(
                  color:  Colors.black.withOpacity(0.5),
                ),
              ),
              //调用我们定义的交织动画Widget
              child: TsmStaggerAnimationPage(
                  controller: _controller
              ),
            ),
          ),
        ),
      ),
    );
  }
}




class TsmStaggerAnimationPage extends StatelessWidget {
  final AnimationController controller;
  Animation<double> _height;
  Animation<EdgeInsets> _padding;
  Animation<Color> _color;

  TsmStaggerAnimationPage({this.controller}) {
    _height = Tween<double>(begin: 0,end: 300)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 1)));
    _padding = Tween<EdgeInsets>(
            begin: const EdgeInsets.only(left: 0),
            end: const EdgeInsets.only(left: 250))
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 1)));
    _color = ColorTween(begin: Colors.redAccent, end: Colors.yellowAccent)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 1)));
  }

  Widget _getWidget(BuildContext context, Widget widget) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: _padding.value,
      child: Container(
        color: _color.value,
        height: _height.value,
        width: 50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _getWidget,
      animation: controller,
    );
  }
}
