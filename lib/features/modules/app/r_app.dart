import 'package:flutter/material.dart';
import 'package:real_app/features/modules/app/a_app.dart';
import 'package:real_app/features/modules/app/p_app.dart';
import 'package:real_app/helpers/c_modules.dart';
import 'package:real_app/helpers/d_exceptions.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';

class AppModule extends Modules {
  AppModule();
  @override
  void registerDependencies() {
    locator.registerLazySingleton(() => AppApi());
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext get appContext =>
      navigatorKey.currentContext ?? (throw ApplicationException("App context is empty."));

  @override
  String get route => "/app";

  @override
  Map<CWidgets, Widget> get ui => {
        CWidgets.cew_app_connection_state: const AppConnectionState(),
        CWidgets.cew_app_connection_state_input: const AppConnectionStateUI(),
      };

  Future<void> onStartUp() async {
    // try {
      await locator<AppApi>().checkBackendConnection();
    // } on BackendException catch (_) {
    //   if (appContext.mounted) {
    //     openBackendInputPopup();
    //   }
    // }
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
