import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:real_app/helpers/a_http.dart';
import 'package:real_app/helpers/d_exceptions.dart';
import 'package:real_app/helpers/d_strings.dart';

abstract class Modules {
  final GetIt module;

  Modules(this.module);

  String get route;
  ApiBase get api => throw UnimplementedException("In c_modules");

  Map<CWidgets, Widget> get ui;

  void registerDependencies();

  Widget getUI(CWidgets x, BuildContext context) {
    return ui[x] ?? const Placeholder();
  }
}
