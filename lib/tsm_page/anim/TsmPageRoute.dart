


import 'package:flutter/cupertino.dart';

/**
 *
 * 重写打开页面的动画
 *   Route有用的属性
 *   isActive
 *   isFirst
 *   isCurrent
 */
class TsmRoute extends PageRoute{

  WidgetBuilder builder;

  TsmRoute({
    @required this.builder,
    this.transitionDuration = const Duration(milliseconds: 100),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
});


  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color barrierColor;

  @override
  final String barrierLabel;

  @override
  final bool maintainState;



  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }


}