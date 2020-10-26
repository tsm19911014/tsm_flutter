



import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app1/utils.dart';

class HttpManager {

  Dio  _dio=Dio();


  TokenInterceptors _tokenInterceptors=TokenInterceptors();



  HttpManager.newInstance(){
    _dio.interceptors.add(LogsInterceptors());
  }


}

class TokenInterceptors{



}

class ResultData{
  String _code;
  String _msg;
  var  headers;


  bool get success=>""==_code;



  ResultData(this._code,this._msg,{this.headers});


}




class ResponseInterceptors extends InterceptorsWrapper{


  @override
  Future onResponse(Response response) {


    RequestOptions options=response.request;
    var value;
    try{
      var header=response.headers[Headers.contentTypeHeader];
      if((header!=null&&header.toString().contains('msg'))){
      }
    }catch(e,stackTree){

    }

    return value;
  }
}







/**
 * 打印日志
 */
class  LogsInterceptors extends InterceptorsWrapper{

  @override
  Future onRequest(RequestOptions options) {
    printString("请求路径:  "+options.path);
    printString("请求头:  "+options.headers.toString());
    if(options.data!=null){
      printString("请求参数:  "+options.data.toString());
    }

    return super.onRequest(options);
  }



  @override
  Future onResponse(Response response) {
    if(response!=null){
      printString("返回参数:  "+response.toString());
    }
    return super.onResponse(response);
  }


  @override
  Future onError(DioError err) {
    if(err!=null){
      printString("请求异常:  "+err.toString());
      printString("请求异常信息:  "+err.response?.toString()?? '');
    }
    return super.onError(err);
  }

}

