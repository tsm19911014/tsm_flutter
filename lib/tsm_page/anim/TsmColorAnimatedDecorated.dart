


import 'package:flutter/cupertino.dart';

class  TsmColorAnimatedDecorated  extends ImplicitlyAnimatedWidget  {
  final BoxDecoration decoration;
  final Widget child;

  TsmColorAnimatedDecorated({
    Key key,
    @required this.decoration,
    this.child,
    Curve curve = Curves.linear, //动画曲线
    @required Duration duration, // 正向动画执行时长
  }) : super(
    key: key,
    curve: curve,
    duration: duration,
  );

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState()=> _TsmColorAnimatedDecoratedState();
}


class _TsmColorAnimatedDecoratedState extends AnimatedWidgetBaseState<TsmColorAnimatedDecorated>  {

  DecorationTween _tween;

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _tween.transform(animation.value),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _tween = visitor(_tween, widget.decoration,
            (value) => DecorationTween(begin: value));
  }



}