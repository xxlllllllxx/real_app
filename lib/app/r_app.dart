import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_app/features/modules/auth/r_auth.dart';
import 'package:real_app/helpers/r_helper.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'a_app.dart';
part 'p_app.dart';

late SharedPreferences appStorage;

class AppModule extends Modules {
  AppModule();

  late String _routeAuth;

  bool isConnectedToInternet = false;
  bool isConnectedToServer = false;

  bool hasSessionToken = false;
  bool hasValidSessionToken = false;

  bool isSessionTokenValid = false;

  bool shouldLogin = false;

  AppCubit get appCubit => locator<AppCubit>();
  AppApi get appApi => locator<AppApi>();
  @override
  void registerDependencies() {
    locator.registerLazySingleton(() => AppApi());
    locator.registerLazySingleton(() => AppCubit(AppState.started));

    _routeAuth = locator<AuthModule>().route;
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

  @override
  Future<bool> beforeInitAsync() async {
    return true;
  }

  @override
  Future<void> duringInitAsync() {
    return start();
  }

  @override
  Future<bool> afterInitAsync() async {
    if (shouldLogin) {
      if (navigatorKey.currentContext!.mounted) {
        navigatorKey.currentContext!.pushReplacement(_routeAuth);
      }
    }
    return true;
  }

  Future<void> checkBackendConnection() async {
    try {
      isConnectedToServer = await appApi.checkBackendConnection();
    } catch (_) {
      isConnectedToServer = false;
    }
  }

  Future<void> checkInternetConnection() async {
    try {
      isConnectedToInternet = await appApi.checkInternetConnection();
    } catch (_) {
      isConnectedToInternet = false;
    }
  }

  Future<void> checkSessionToken() async {
    try {
      hasSessionToken = LocalStorage.SESSION_TOKEN.exists;
      if (!hasSessionToken) return;
      if (!isConnectedToServer) return;
      hasValidSessionToken =
          await appApi.validateToken(LocalStorage.SESSION_TOKEN.stringValue);
    } catch (_) {
      hasSessionToken = false;
      hasValidSessionToken = false;
    }
  }

  Future<void> checkShouldLogin() async {
    try {
      // if (hasValidSessionToken) return;
      // if (!isConnectedToServer) return;
      shouldLogin = true;
    } catch (_) {
      hasSessionToken = false;
      shouldLogin = false;
    }
  }

  Future<void> start() async {
    if (appCubit.state == AppState.started) {
      await checkBackendConnection();
      await checkInternetConnection();
      await checkSessionToken();
      await checkShouldLogin();
    }
  }
}
