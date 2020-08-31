import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_app1/widget/ViewInflate.dart';

class TsmDialogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog 学习'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                child: inflateText('AlertDialog', Colors.white, 15),
                color: Colors.redAccent,
                splashColor: Colors.pink,
                onPressed: () async {
                  var tsm = await _getAlertDialog(context);
                  printString('This num is ${tsm}');
                }),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                child: inflateText('SimpleDialog', Colors.white, 15),
                color: Colors.redAccent,
                splashColor: Colors.pink,
                onPressed: () {
                  _getSimpleDialog(context);
                }),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                child: inflateText('重洗动画与背景色', Colors.white, 15),
                color: Colors.redAccent,
                splashColor: Colors.pink,
                onPressed: () {
                  showCustomDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('Title'),

                            ///如果内容过长,需要使用SingleChildScrollView
                            content: Scrollbar(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Text(
                                    "这个是内容...这个是内容...这个是内容...这个是内容...这个是内容...这个是内容...这个是内容...这个是内容..." *
                                        20),
                              ),
                            ),
                            actions: [
                              FlatButton(
                                child: Text('取消'),
                                onPressed: () => Navigator.of(context).pop(0),
                              ),
                              FlatButton(
                                child: Text('确定'),
                                onPressed: () => Navigator.of(context).pop(1),
                              )
                            ],
                          ));
                }),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
                child: inflateText('日期选择', Colors.white, 15),
                color: Colors.redAccent,
                splashColor: Colors.pink,
                onPressed: () {
                  selectDate(context);
                }),
          ],
        ),
      ),
    );
  }

  void selectDate(BuildContext context) async{

    DateTime dateTime=DateTime.now();

   var date=await showModalBottomSheet<DateTime>(
        context: context,
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: FlatButton(child: Text('取消'),
                  onPressed: (){
                    Navigator.of(context).pop();
                  },),
                ),


                Expanded(
                  flex: 1,
                  child: FlatButton(child: Text('确定',textDirection: TextDirection.rtl),
                    onPressed: (){
                      Navigator.of(context).pop(dateTime);
                    },),
                ),
              ],
            ),
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                onDateTimeChanged: (date) {
                  dateTime=date;
                },
                mode: CupertinoDatePickerMode.date,
                maximumDate: DateTime.now().add(Duration(days: 20)),
                minimumDate: DateTime.now().add(Duration(days: -20)),
              ),
            )
          ],
        ),);

   printString('date:${date??''}');
  }
}

_getSimpleDialog(BuildContext context) async {
  var lan = await showDialog<int>(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text('Title'),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SimpleDialogOption(
            child: Text('这个是第一个'),
            onPressed: () => Navigator.of(context).pop(0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: SimpleDialogOption(
            child: Text('这个是第二个'),
            onPressed: () => Navigator.of(context).pop(1),
          ),
        )
      ],
    ),
  );
  printString('language is ${lan}');
}

Future<int> _getAlertDialog(BuildContext context) {
  return showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Title'),

            ///如果内容过长,需要使用SingleChildScrollView
            content: Scrollbar(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Text(
                    "这个是内容...这个是内容...这个是内容...这个是内容...这个是内容...这个是内容...这个是内容...这个是内容..." *
                        20),
              ),
            ),
            actions: [
              FlatButton(
                child: Text('取消'),
                onPressed: () => Navigator.of(context).pop(0),
              ),
              FlatButton(
                child: Text('确定'),
                onPressed: () => Navigator.of(context).pop(1),
              )
            ],
          ),

      ///点击dialog 外部是否消失
      barrierDismissible: true);
}

Future<T> showCustomDialog<T>(
    {@required BuildContext context, WidgetBuilder builder}) {
  var theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog<T>(
    context: context,
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      var widget = Builder(
        builder: builder,
      );
      return SafeArea(
        child: theme != null ? Theme(child: widget, data: theme) : widget,
      );
    },
    barrierDismissible: true,
    barrierLabel: 'lable',
    barrierColor: Colors.lightBlueAccent,
    transitionDuration: Duration(milliseconds: 300),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
