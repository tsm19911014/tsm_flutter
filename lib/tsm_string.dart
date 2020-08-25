import 'utils.dart';

void main(){


  String  name='tsm';
  String title='title';

  String string='''
      $name
      $title
      ''';
  printString(string);


  String str3='d\n'
      'e'
      'f';
  printString(str3);


  String str4=r'o\n'
      'p'
      'q';
  printString(str4);


  String str='tsm,' 'b,' ',m,';
  printString(str);
  printString(str.length);///  长度
  printString(str.isEmpty);/// 是否做空
  printString(str.isNotEmpty);///是否不为空
  printString(str.trimLeft());///去除字符串前面的空格
  printString(str.trimRight());///去除字符串后面的空格
  printString(str.trim());///去除字符串两端的空格
  printString(str.replaceFirst('b', '将b换为了d以后'));/// 替换
  printString(str.split(','));///分割
  printString(str.replaceFirstMapped('m', (match) => '搞不懂',4));///从第四位开始,将m替换为  搞不懂


  String strings=str.splitMapJoin(',',onMatch: (Match match) {
    return "y";
  },onNonMatch: (String string){
    return 'n';
  });
  printString(strings);

///  printString(1+'qqq');///这种写法报错
  printString(1.toString()+'qqq');///正确写法
}




//String _formatString(String str){
//  return str+'fromat';
//}




