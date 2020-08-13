import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../tsm_page_routes.dart';

class TsmMainPage extends StatefulWidget {
  @override
  _TsmMainState createState() => _TsmMainState();
}

class _TsmMainState extends State<TsmMainPage> {
  List<String> list;

  @override
  void initState() {
    super.initState();
    list = [
      'Scaffold 学习',
      'AppBar学习',
      'Container 学习',
      'Row and Column',
      'Text 拼接,与富文本',
      'TextField 输入框学习',
      'RaisedButton 学习',
      'Icon  学习'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主页'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (BuildContext, int) => Container(
              child: RaisedButton(
            child: Center(
              child: Text(
                list[int],
                style: TextStyle(color: Colors.black87, fontSize: 16),
              ),
            ),
            onPressed: () {
              _onPressedItem(context, int);
            },
          )),
          itemCount: list.length,
        ),
      ),
    );
  }
}

void _onPressedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).pushNamed(page_routes_scaffold);
      break;
    case 1:
      Navigator.of(context).pushNamed(page_routes_appbar);
      break;
    case 2:
      Navigator.of(context).pushNamed(page_routes_container);
      break;
    case 3:
      Navigator.of(context).pushNamed(page_routes_row_and_column);
      break;
    case 4:
      Navigator.of(context).pushNamed(page_routes_text);
      break;
    case 5:
      Navigator.of(context).pushNamed(page_routes_text_field);
      break;
    case 6:
      Navigator.of(context).pushNamed(page_routes_raised_button);
      break;
    case 7:
      Navigator.of(context).pushNamed(page_routes_icon);
      break;
  }
}
