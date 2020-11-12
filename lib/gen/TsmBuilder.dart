
import 'package:build/build.dart';
import 'package:flutter_app1/gen/TsmPageRouteGenerator.dart';
import 'package:source_gen/source_gen.dart';

Builder  tsmPageRouteBuilder(BuilderOptions options) => LibraryBuilder(TsmPageRouteGenerator(),generatedExtension: '.page.dart');