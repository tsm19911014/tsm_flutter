import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class TsmShareInteritedWidget extends InheritedWidget {


  TsmShareInteritedWidget({@required this.data, Widget child}) : super(child: child);

  final int data;

  @override
  bool updateShouldNotify(TsmShareInteritedWidget oldWidget) {
    return oldWidget.data != data;
  }

  ///  源码中方法
  ///  获取数据同时绑定
  ///
  ///  @override
  ///   T dependOnInheritedWidgetOfExactType<T extends InheritedWidget>({Object aspect}) {
  ///     assert(_debugCheckStateIsActiveForAncestorLookup());
  ///     final InheritedElement ancestor = _inheritedWidgets == null ? null : _inheritedWidgets[T];
  ///     if (ancestor != null) {
  ///       assert(ancestor is InheritedElement);
  ///       return dependOnInheritedElement(ancestor, aspect: aspect) as T;
  ///     }
  ///     _hadUnsatisfiedDependencies = true;
  ///     return null;
  ///    }
  ///
  ///
  static TsmShareInteritedWidget of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TsmShareInteritedWidget>();
  }

  /// 只获取数据
  ///
  ///
  ///
  ///源码中的方法
  ///  @override
  ///  InheritedElement getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() {
  ///    assert(_debugCheckStateIsActiveForAncestorLookup());
  ///    final InheritedElement ancestor = _inheritedWidgets == null ? null : _inheritedWidgets[T];
  ///    return ancestor;
  ///  }
  static TsmShareInteritedWidget ofData(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<TsmShareInteritedWidget>()
        .widget;
  }
}

///  总结,通过查看源码发现,dependOnInheritedWidgetOfExactType  依赖关系真正建立的时机是  dependOnInheritedElement  这个方法,除了这个,其实这两个方法都是一样的
///
///   这就实现了使用   dependOnInheritedWidgetOfExactType  该方法时,不仅可以使用数据,同时在数据发生变更的同时,didChangeDependencies  方法还是调用
///   而  getElementForInheritedWidgetOfExactType  这个方法只能使用数据,
///
///   其实在使用过程中还会发生 如果  didChangeDependencies  方法发生变化,其实build 方法也会被调用,费什么非要多此一举呢,其实如果数据发生变化是触发请求接口的条件
///   如果该条件放在build中,则请求接口会发发生的很频繁,而didChangeDependencies 则是可控制的变成,更为合理
///
///
