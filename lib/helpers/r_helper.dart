// ignore_for_file: constant_identifier_names

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

import 'package:shared_preferences/shared_preferences.dart';

part 'a_bloc_observer.dart';
part 'a_exceptions.dart';
part 'a_http.dart';
part 'a_modules.dart';
part 'd_constants.dart';
part 'r_modules.dart';
part 'a_router.dart';

GetIt locator = GetIt.instance;
bool hasErrorDialog = false;

enum LocalStorage {
  BACKEND_IS_SECURE,

  SERVER_LINK,
  SERVER_HEADERS,

  SELECTED_THEME,

  SESSION_TOKEN,
}

Future<void> registerHelpers(GetIt locator) async {
  Bloc.observer = const AppBlocObserver();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (details.exception is ShowDialogException && !hasErrorDialog) {
      hasErrorDialog = true;
      (details.exception as ShowDialogException)
          .showAppDialog()
          .then((_) => hasErrorDialog = false);
    }
  };

  HydratedStorage storage = await loadStorage(locator);
  locator.registerSingleton<HydratedStorage>(storage);

  appStorage = await SharedPreferences.getInstance();

  HydratedBloc.storage = locator<HydratedStorage>();

  if (LocalStorage.SERVER_LINK.notExists) {
    await LocalStorage.SERVER_LINK.setString(c_temp_server_link);
  }
  if (LocalStorage.BACKEND_IS_SECURE.notExists) {
    await LocalStorage.BACKEND_IS_SECURE.setBool(c_temp_is_secure);
  }
  if (LocalStorage.SERVER_HEADERS.notExists) {
    await LocalStorage.SERVER_HEADERS.setStringMap(c_temp_headers);
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

extension CXLocalStorage on LocalStorage {
  bool get exists {
    return appStorage.containsKey(toString());
  }

  bool get notExists {
    return !appStorage.containsKey(toString());
  }

  String get stringValue {
    String? x = appStorage.getString(toString());
    if (x == null) {
      return defaultSettings[this] ??
          UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<void> setString(String value) async {
    await appStorage.setString(toString(), value);
  }

  bool get boolValue {
    bool? x = appStorage.getBool(toString());
    if (x == null) {
      return defaultSettings[this] ??
          UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<void> setBool(bool value) async {
    await appStorage.setBool(toString(), value);
  }

  int get intValue {
    int? x = appStorage.getInt(toString());
    if (x == null) {
      return defaultSettings[this] ??
          UnimplementedError("${toString()} not found.");
    } else {
      return x;
    }
  }

  Future<void> setInt(int value) async {
    await appStorage.setInt(toString(), value);
  }

  List<T> listValue<T>() {
    String? jsonString = appStorage.getString(toString());
    if (jsonString == null) {
      return defaultSettings[this] ??
          UnimplementedError("${toString()} not found.");
    } else {
      List<dynamic> jsonList = json.decode(jsonString);
      return jsonList.cast<T>();
    }
  }

  Future<void> setList<T>(List<T> value) async {
    String jsonString = json.encode(value);
    await appStorage.setString(toString(), jsonString);
  }

  Map<String, String> stringMapValue() {
    String? jsonString = appStorage.getString(toString());
    if (jsonString == null) {
      return defaultSettings[this] ??
          UnimplementedError("${toString()} not found.");
    } else {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return jsonMap.map((key, value) => MapEntry(key, value.toString()));
    }
  }

  Future<void> setStringMap(Map<String, String> value) async {
    String jsonString = json.encode(value);
    await appStorage.setString(toString(), jsonString);
  }
}
