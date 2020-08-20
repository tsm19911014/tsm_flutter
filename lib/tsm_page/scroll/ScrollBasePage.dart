import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../tsm_page_routes.dart';

class ScrollBasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> list = ["SingleChildScrollView"];
    return Scaffold(
        appBar: AppBar(
          title: Text('ScrollView 集合'),
          centerTitle: true,
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) => LayoutBuilder(
                  builder: (context, cons) {
                    return SizedBox(
                      width: cons.maxWidth,
                      child: RaisedButton(
                        child: Text(list[index]),
                        onPressed: () => clickItem(context, index),
                      ),
                    );
                  },
                )));
  }

  void clickItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed(page_routes_single_child_scroll_view);
        break;
    }
  }
}
