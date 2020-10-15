




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/tsm_page/bloc/flutterbolc/TsmCountCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'TsmCountObserve.dart';


class TsmFlutterBLoCPageBase extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Bloc.observer = TsmCountObserve();
    return BlocProvider(
      create: (context)=>TsmCountCubit(0),
      child: TsmFlutterBLoCPage(),
    );
  }
}

class TsmFlutterBLoCPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_TsmFlutterBLoCState();
}

class _TsmFlutterBLoCState extends State<TsmFlutterBLoCPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter BLoC 学习'),
        centerTitle: true,
      ),
      body: BlocBuilder<TsmCountCubit,int>(
        builder: (con,count){
          return Container(
            child: Text(count.toString()),
            alignment: Alignment.center,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('counterView_increment_floatingActionButton'),
        child: const Icon(Icons.add),
        onPressed: () => context.bloc<TsmCountCubit>().increment(),
      ),
    );
  }
}
