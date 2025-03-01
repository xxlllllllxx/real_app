import 'package:flutter/material.dart';
import 'package:real_app/helpers/r_helper.dart';

part 'a_auth.dart';
part 'p_auth.dart';
part 'c_strings.dart';

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
