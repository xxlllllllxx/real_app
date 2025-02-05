import 'package:flutter/material.dart';
import 'package:real_app/helpers/d_constants.dart';

abstract class Modules {

  Modules() {
    registerDependencies();
  }

  String get route;

  Map<CWidgets, Widget> get ui;

  void registerDependencies();

  Widget getUI(CWidgets x, {or = const SizedBox()}) {
    return ui[x] ?? debugWidget ?? or;
  }
}
