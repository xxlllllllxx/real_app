import 'package:flutter/material.dart';
import 'package:real_app/features/modules/app/a_app.dart';
import 'package:real_app/features/modules/app/p_app.dart';
import 'package:real_app/helpers/c_modules.dart';
import 'package:real_app/helpers/d_exceptions.dart';
import 'package:real_app/helpers/d_strings.dart';

class AppModule extends Modules {
  AppModule(super.module);
  @override
  void registerDependencies() {
    module.registerLazySingleton(() => AppApi());
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get appContext =>
      navigatorKey.currentContext ?? (throw SafeException());

  @override
  String get route => "/app";

  @override
  AppApi get api => module<AppApi>();

  @override
  Map<CWidgets, Widget> get ui => {
        CWidgets.cew_app_connection_state: const AppConnectionState(),
        CWidgets.cew_app_connection_state_input: const AppConnectionStateUI(),
      };

  Future<void> onStartUp() async {
    api.checkBackendConnection().then((e) => {
          if (!e && (appContext.mounted)) {openBackendInputPopup()},
        });
    return;
  }

  void openBackendInputPopup() {
    showDialog(
        context: appContext,
        builder: (buildContext) {
          return ui[CWidgets.cew_app_connection_state_input] ??
              const Placeholder();
        });
  }
}
