import 'dart:async';

import 'package:flutter/material.dart';
import 'package:real_app/helpers/r_helper.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'a_app.dart';
part 'p_app.dart';

class AppModule extends Modules {
  AppModule();

  AppCubit get appCubit => locator<AppCubit>();
  AppApi get appApi => locator<AppApi>();
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
  String get route => BackendPaths.app;

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

  Future<void> checkBackendConnection(_) async {
    try {
      bool isConnected = await appApi.checkBackendConnection();
      if (isConnected) {
        return;
      }
      throw ApplicationException("Something went wrong!", module: "App Module");
    } catch (_) {
      if (appContext.mounted) {
        await showDialog(
          context: appContext,
          builder: (_) =>
              ui[CWidgets.cew_app_connection_state_input] ?? cw_progress,
        ).then(checkBackendConnection);
      }
    }
  }

  void start() {
    if (appCubit.state == AppState.started) {
      checkBackendConnection(false);
    }
  }
}
