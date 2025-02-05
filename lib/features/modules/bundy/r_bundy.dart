import 'package:flutter/material.dart';
import 'package:real_app/helpers/a_modules.dart';
import 'package:real_app/features/modules/bundy/a_bundy.dart';
import 'package:real_app/features/modules/bundy/p_bundy.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';

class BundyModule extends Modules {
  @override
  String get route => '/';
  BundyModule();

  @override
  void registerDependencies() {
    locator.registerLazySingleton(() => BundyApi());
  }

  @override
  Map<CWidgets, Widget> ui = {
    CWidgets.cew_bundy: const BundyUI(),
  };

  void refresh() {
    locator<BundyApi>().refresh();
  }
}
