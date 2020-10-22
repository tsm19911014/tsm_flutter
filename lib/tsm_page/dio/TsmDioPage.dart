import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/bloc/flutterbolc/TsmCountCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TsmDioCubit.dart';

class TsmDioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return  Scaffold(
      appBar: AppBar(
        title: Text('Dio 学习'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (_) => TmsDioCubit(),
        child: TsmDioMainPage(),
      ),
    );
  }
}

class TsmDioMainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>_TsmDioMainState();
}


class _TsmDioMainState extends State<TsmDioMainPage>{

  @override
  void initState() {
    super.initState();
  }



  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: ListView(
        children: [
          RaisedButton(
            child: Text('Get 请求'),
            onPressed: () async{
                try{
                  Response response=await Dio().get('http://apis.juhe.cn/lottery/types');
                  context.bloc<TmsDioCubit>().afterDio(response.data.toString());
                }catch(e ,stackTree){
                  context.bloc<TmsDioCubit>().afterDio(e.toString());
                }
            },
          ),

          SizedBox(
            height: 15,
          ),

          RaisedButton(
            child: Text('Post 请求'),
            onPressed: ()  {
              try{
                 Dio().post("http://v.juhe.cn/toutiao/index",data: '{"type":"top","key":"gadsgdasgtegfdgdfgdf"}')..then((value) {
                   context.bloc<TmsDioCubit>().afterDio(value.toString());
                 });
              }catch(e ,stackTree){
                context.bloc<TmsDioCubit>().afterDio(e.toString());
              }
            },
          ),

          BlocBuilder<TmsDioCubit, String>(
            builder:(con,int){
              return Text(int);
            },
          )
        ],
      ),
    );
  }

}



