

import 'package:flutter/widgets.dart';

class  TsmProviderBean  extends ChangeNotifier{

  TsmProviderBean(this._what,this._msg);



  String _msg;
  int _what;
  String _targit;


  String get  msg=>_msg;
  int get what=>_what;
  String get targit=>_targit;


  insertMessage(String msg,int what){
    this._msg=msg;
    this._what+=what;
    notifyListeners();
  }
}