import 'package:flutter/material.dart';
import 'package:real_app/features/modules/auth/a_auth.dart';
import 'package:real_app/features/modules/auth/p_auth.dart';
import 'package:real_app/helpers/a_modules.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';

class AuthModule extends Modules {
  bool authenticated = false;

  @override
  void registerDependencies() {
    locator.registerLazySingleton(() => AuthApi());
  }

  @override
  String get route => "/login";

  @override
  Map<CWidgets, Widget> get ui => {
    CWidgets.cew_main: const LoginUI(),
  };
}
