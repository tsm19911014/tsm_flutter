import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/utils.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

class TsmTextPage extends StatefulWidget {
  @override
  _TsmTextPageState createState() => _TsmTextPageState();
}

class _TsmTextPageState extends State<TsmTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text 例子'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                '学习Text',
                textAlign: TextAlign.center,

                ///文本对齐方式  居中
                textDirection: TextDirection.ltr,

                ///文本方向

                ///是否自动换行 false文字不考虑容器大小
                ///单行显示   超出；屏幕部分将默认截断处理
                softWrap: false,

                ///文字超出屏幕之后的处理方式  TextOverflow.clip剪裁
                ///TextOverflow.fade 渐隐  TextOverflow.ellipsis省略号
                overflow: TextOverflow.ellipsis,

                textScaleFactor: 2.0,

                ///字体显示的赔率
                maxLines: 10,

                ///最大行数
                style: new TextStyle(
                  decorationColor: Colors.redAccent,

                  ///线的颜色
                  ///none无文字装饰   lineThrough删除线
                  /// overline文字上面显示线    underline文字下面显示线
                  decoration: TextDecoration.underline,

                  ///文字装饰的风格  dashed,dotted虚线(简短间隔大小区分)
                  ///  double三条线  solid两条线
                  decorationStyle: TextDecorationStyle.solid,
                  wordSpacing: 0.0,

                  ///单词间隙(负值可以让单词更紧凑)
                  letterSpacing: 0.0,

                  ///字母间隙(负值可以让字母更紧凑)
                  fontStyle: FontStyle.italic,

                  ///文字样式，斜体和正常
                  fontSize: 20.0,

                  ///字体大小
                  fontWeight: FontWeight.w900,

                  ///字体粗细  粗体和正常
                  color: Colors.redAccent,

                  ///文字颜色
                ),
              ),

//          -----------------------------------------------------------------------------------------------        ///

              Text.rich(
                new TextSpan(
                  text: 'TextSpan',
                  style: new TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 30.0,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                      text: '文本1',
                      style: new TextStyle(
                        color: Colors.yellow,
                      ),
                    ),
                    new TextSpan(
                      text: '文本2',
                      style: new TextStyle(
                        color: Colors.redAccent,
                      ),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          printString('tsmClick');
                        },
                    ),
                  ],
                ),
              ),

              ///  html 标签页可以实现 富文本,个人感觉这种方式其实更简单粗暴,
              ///  我在开发android的过程中很多都是用它实现的,要不然多语言实现富文本简直太酸爽了
              ///自己试验了半天,都没办法让他居中,
              ///
              ///
              /// 导包方式  在pubspec.yaml 的
              /// dependencies:  下面增加这句话
              /// flutter_html: ^1.0.0
              ///  导包之前先确认是否增加了系统变量  注意是系统变量,
              ///  不是用户变量,看了几篇都说是用户环境变量,试验后不成功,改为系统环境变量后正确使用
              ///      PUB_HOSTED_URL=https://pub.flutter-io.cn
              ///      FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
              ///
              ///
              ///
              ColoredBox(
                color: Colors.purpleAccent,
                child: Html(
                  data: '<a  href="http://www.baidu.com">这个是网页...<?a>',
                  onLinkTap: (String url) {
                    printString(url);
                  },
                  style: {
                    "html": Style(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20)),
                  },
                ),
              )
            ]),
      ),
    );
  }
}
