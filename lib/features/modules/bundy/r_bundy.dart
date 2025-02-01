import 'package:flutter/material.dart';
import 'package:real_app/helpers/c_modules.dart';
import 'package:real_app/features/modules/bundy/a_bundy.dart';
import 'package:real_app/features/modules/bundy/p_bundy.dart';
import 'package:real_app/helpers/d_constants.dart';

class BundyModule extends Modules {
  @override
  String get route => '/';
  BundyModule(super.module);

  @override
  void registerDependencies() {
    module.registerSingleton(() => BundyApi());
  }

  @override
  Map<CWidgets, Widget> ui = {
    CWidgets.cew_bundy: const BundyUI(),
  };
}
