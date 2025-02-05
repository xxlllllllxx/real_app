import 'package:flutter/material.dart';
import 'package:real_app/app/a_app.dart';
import 'package:real_app/app/p_app.dart';
import 'package:real_app/helpers/a_modules.dart';
import 'package:real_app/helpers/a_exceptions.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';

class AppModule extends Modules {
  AppModule();

  AppCubit get appCubit => locator<AppCubit>();
  @override
  void registerDependencies() {
    locator.registerLazySingleton(() => AppApi());
    locator.registerLazySingleton(() => AppCubit(AppState.started));
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get appContext =>
      navigatorKey.currentContext ??
      (throw ApplicationException("App context is empty."));

  @override
  String get route => "/";

  @override
  Map<CWidgets, Widget> get ui => {
        CWidgets.cew_main: const AppSplash(),
        CWidgets.cew_app_connection_state: const AppConnectionState(),
        CWidgets.cew_app_connection_state_input: const AppConnectionStateUI(),
      };

  bool mainBuildWhen(AppState prev, AppState curr) {
    if (curr == AppState.themeChanged) {
      return true;
    }
    return false;
  }
}
