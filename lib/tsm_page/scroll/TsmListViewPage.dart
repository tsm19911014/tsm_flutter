import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_app1/widget/ViewInflate.dart';

class TsmListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TsmListViewPage();
}

class _TsmListViewPage extends State<TsmListViewPage> {
  List<String> list_str;
  String endTag;

  List<String> page = [
    '条目1',
    '条目2',
    '条目3',
    '条目4',
    '条目5',
    '条目6',
    '条目7',
    '条目8',
    '条目9',
    '条目10'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView 学习'),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  getBody() {
    if ((list_str ??= []).length == 0) {
      return getEmptyView();
    }
    return getListBody();
  }

  getListBody() {
    if (list_str.length < 100) {
      loadDate();
    }
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          list_str.clear();
          loadDate();
        });
      },
      child: ListView.separated(
          itemCount: list_str.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            if (list_str[index] == endTag) {
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              return Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: inflateText(list_str[index], Colors.blueAccent, 16),
              );
            }
          }),
    );
  }

  loadDate() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        list_str ??= [];
        if (list_str.length == 0) {
          list_str.add(endTag);
        }
        list_str.insertAll(list_str.length - 1, page);

        if (list_str.length > 100) {
          list_str.removeAt(list_str.length - 1);
          list_str.add("没有更多条目了");
        }
      });
    });
  }

  getEmptyView() {
    return Container(
      color: Colors.white,
      child: Center(
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.adjust),
              SizedBox(
                height: 10,
              ),
              inflateText('点击刷新', Colors.redAccent, 14),
            ],
          ),
          onTap: () {
            loadDate();
            printString("开始刷新");
          },
        ),
      ),
    );
  }
}
