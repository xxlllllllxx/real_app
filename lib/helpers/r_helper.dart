import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_app/app/r_app.dart';
import 'package:real_app/features/modules/auth/r_auth.dart';
import 'package:real_app/features/modules/bundy/r_bundy.dart';
import 'package:real_app/features/modules/dashboard/r_dashboard.dart';
import 'package:real_app/features/modules/settings/r_settings.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

part 'a_bloc_observer.dart';
part 'a_exceptions.dart';
part 'a_http.dart';
part 'a_modules.dart';
part 'd_constants.dart';
part 'r_modules.dart';
part 'a_router.dart';

GetIt locator = GetIt.instance;

Future<void> registerHelpers(GetIt locator) async {
  Bloc.observer = const AppBlocObserver();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (details.exception is ShowDialogException) {
      (details.exception as ShowDialogException).showAppDialog();
    }
  };

  HydratedStorage storage = await loadStorage(locator);
  locator.registerSingleton<HydratedStorage>(storage);

  HydratedBloc.storage = locator<HydratedStorage>();

  if (CSettings.serverLink.notExists) {
    await CSettings.serverLink.setString(c_temp_server_link);
  }
  if (CSettings.backendIsSecure.notExists) {
    await CSettings.backendIsSecure.setBool(c_temp_is_secure);
  }
  if (CSettings.serverHeaders.notExists) {
    await CSettings.serverHeaders.setStringMap(c_temp_headers);
  }

  return;
}

Future<HydratedStorage> loadStorage(GetIt locator) async {
  if (kIsWeb) {
    return HydratedStorage.build(
        storageDirectory: HydratedStorage.webStorageDirectory);
  } else {
    return HydratedStorage.build(
      storageDirectory: (await getApplicationDocumentsDirectory()),
    );
  }
}

extension StringToObject on String {
  T toObject<T>() {
    try {
      return json.decode(this);
    } catch (e) {
      throw Exception("Invalid JSON string");
    }
  }
}

Widget snapshotCheck(AsyncSnapshot snapshot, Widget Function(Object data) x,
    {Widget or = cw_progress}) {
  if (snapshot.hasData) {
    return x(snapshot.data);
  }
  return or;
}

abstract class SerialObject {
  SerialObject();
  Map<String, String> toJson();
  factory SerialObject.fromJson(Map<String, String> json) =>
      throw UnimplementedException("Needs to override fromJson");
}