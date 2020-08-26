import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app1/utils.dart';

class TsmTextFieldPage extends StatefulWidget {
  @override
  _TsmTextFieldPageState createState() => _TsmTextFieldPageState();
}

class _TsmTextFieldPageState extends State<TsmTextFieldPage> {
  ///默认文本和获取文本框内容的
  TextEditingController _mController;


  ///协助获取焦点
  FocusNode _mFocusNode;

  /// error text  不为null时 显示 errorborder
  String _errorText;
  /// 是否明文
  bool isSHow = false;

  @override
  void initState() {
    super.initState();
    _mController = TextEditingController(text:'这个是默认文字');
    _mFocusNode = FocusNode();
    _mFocusNode.addListener(() {
      printString('has Focus:${_mFocusNode.hasFocus}');
    });
  }

  void initTextField() {}

  /// 给予焦点
  void _getFocus() {
    FocusScope.of(context).requestFocus(_mFocusNode);
    printString(_mController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField 学习'),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.bottomCenter,
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: TextField(

                controller: _mController,

                ///用于帮助获取焦点
                focusNode: _mFocusNode,

                ///自动更正  默认给的true   没找到具体有什么用,在TextField 中的介绍非常少
                autocorrect: true,

                ///光标颜色
                cursorColor: Colors.yellow,

                ///首次进入焦点在他身上
                autofocus: true,

                ///是否显示输入信息
                obscureText: isSHow,

                ///  大小写格式
                textCapitalization: TextCapitalization.characters,

                ///  textField 样式
                decoration: InputDecoration(
                  ///左侧图片,在输入框外部
                  icon: Icon(Icons.title),


                  /// 标题
                  labelText: '用户名',

                  ///底部描述
                  helperText: "helperText",

                  /// 和描述同一位置的error   他必须为null的时候才不会展示错误状态的颜色
                  errorText: _errorText,

                  ///获取焦点并且内容为空的时候显示内容
                  hintText: 'hintText',

                  ///填充颜色  只有filled  为 true的额时候这个颜色设置才有效
                  fillColor: Colors.purpleAccent,

                  ///是否填充
                  filled: false,

                  ///前缀  始终显示,获取焦点后变换颜色
                  prefixIcon: Icon(Icons.bookmark),

//                  ///  前缀  获取焦点后显示
//                  prefix: Icon(Icons.book),

                  ///后缀  始终显示,获取焦点后变换颜色
                  suffixIcon: GestureDetector(
                    child: Icon(Icons.remove_red_eye,
                        color: isSHow ? Colors.blueAccent : Colors.grey),
                    onTap: () {
                      setState(() {
                        isSHow = !isSHow;
                        printString(isSHow);
                      });
                    },
                  ),

//                  ///  后缀  获取焦点后显示
//                  suffix: Icon(Icons.cancel),

                  ///默认情况下底部边框
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),

                  ///错误的时候的边框
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),

                  ///不可编辑的时候的边框
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent),
                  ),

                  /// 可以编辑的时候的边框
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),

                  ///获取到焦点时的颜色
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.greenAccent),
                  ),
                ),

                /// 输入规则
                inputFormatters: [
                  ///长度 最大10位
                  LengthLimitingTextInputFormatter(10),

//                  ///黑名单  除了黑名单的都可以  也有白名单
//                  BlacklistingTextInputFormatter(RegExp('[A-G]'))
                ],

                ///输入信息改变后回调
                onChanged: (String content) {
                  if (content.contains(RegExp('a'))) {
                    setState(() {
                      _errorText = "不能含有a";
                    });
                  } else {
                    if (!_errorText.isEmpty) {
                      setState(() {
                        _errorText = null;
                      });
                    }
                  }
                  printString(content);
                },

                ///点击回车按钮回调
                onSubmitted: (String content) {
                  printString(content);
                },
              ),
            ),
            Container(
              child: TextField(),
            ),
            RaisedButton(
              child: Text("获取焦点,并打印打一个TextField内容"),
              onPressed: _getFocus,
            )
          ],
        ),
      ),
    );
  }
}
