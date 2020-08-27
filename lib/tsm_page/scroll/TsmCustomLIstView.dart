import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';

class TsmCustomScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmCustomScrollViewState();
}

class _TsmCustomScrollViewState extends State<TsmCustomScrollViewPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),

        ///越界回弹效果
        slivers: [
          SliverAppBar(
            centerTitle: true,
            titleSpacing: 0,
            title: Text(
              'CustomScrollView',
              style: TextStyle(color: Colors.black87),
            ),
            snap: false,

            /// 停止拖动是否 继续响应拖动事件
            floating: true,

            ///floating(浮动) 控制展开的，
            pinned: true,
            onStretchTrigger: () {
              printString('onStretchTrigger');
              return;
            },

            ///pinned(固定的)  控制隐藏和展示的   false 就是可以滑出屏幕外  true 不可以
            flexibleSpace: LayoutBuilder(builder: (context,cons){

              return FlexibleSpaceBar(
//              collapseMode: CollapseMode.pin,
                  background: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/hor.jpg'), fit: BoxFit.fill),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Text(
                          '这个是头部',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '这个是头部',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '这个是头部',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '这个是头部',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          '这个是头部',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ));
            },),
            backgroundColor: Colors.blueAccent,
            expandedHeight: 200,
          ),
          CupertinoSliverRefreshControl(
            refreshIndicatorExtent: 100,
            refreshTriggerPullDistance: 140,
            onRefresh: () async {
              printString('CupertinoSliverRefreshControl   onRefresh');
            },
          ),
          SliverPersistentHeader(
            floating: true,
            pinned: false,
            delegate: _SliverPersistenHeaderDelegate(
                minHeight: 50, maxHeight: 150, child: Text('1111')),
          ),
          SliverSafeArea(
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => Container(
                          height: 50,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.all(Radius.circular(9)),
                          ),
                          child: Center(
                            child: Text(index.toString()),
                          ),
                        ),
                    childCount: 50)),
          )
        ],
      ),
    );
  }
}

class _SliverPersistenHeaderDelegate extends SliverPersistentHeaderDelegate {
  double maxHeight;
  double minHeight;
  Widget child;

  _SliverPersistenHeaderDelegate({this.maxHeight, this.minHeight, this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => max<double>(minHeight, maxHeight);

  @override
  // TODO: implement minExtent
  double get minExtent => min<double>(minHeight, maxHeight);

  @override
  bool shouldRebuild(_SliverPersistenHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
