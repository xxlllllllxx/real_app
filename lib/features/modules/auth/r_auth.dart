import 'package:flutter/material.dart';
import 'package:real_app/helpers/a_http.dart';
import 'package:real_app/helpers/a_modules.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';
import 'package:real_app/features/settings/r_settings.dart';

part 'a_auth.dart';
part 'p_auth.dart';

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
