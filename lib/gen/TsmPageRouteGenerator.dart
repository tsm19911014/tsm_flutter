



import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:flutter_app1/gen/TsmPageRoute.dart';
import 'package:source_gen/source_gen.dart';

class TsmPageRouteGenerator extends GeneratorForAnnotation<TsmPageRoute>{

  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    String className=element.displayName;
    String path=buildStep.inputId.path;
     String name=annotation.peek('_page_route').stringValue;
     return '//    $className\n//    $path\n//    $name';
  }

}