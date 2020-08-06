extension ExtensionString on String{
  /// 这个是属性
  bool  get  isPhone=> this.isEmpty?true:false;
  ///这个方法
  bool  isPhoneNum()=>this.isEmpty?true:false;
}