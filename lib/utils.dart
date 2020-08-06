///受到保护的方法
void printString(dynamic string){
  if(string!=null){
    print('msg =${string?.toString()}');
  }

  String tsm='tsm';
  tsm.isPhone;
  tsm.isPhoneNum();
}
extension ExtensionString on String{
  /// 这个是属性
  bool  get  isPhone=> this.isEmpty?true:false;
  ///这个方法
  bool  isPhoneNum()=>this.isEmpty?true:false;
}


String checkEmptyString(String string)=>string??="";
