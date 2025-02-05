import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/a_exceptions.dart';
import 'package:real_app/helpers/a_bloc_observer.dart';

import 'dart:convert';

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
    await CSettings.serverLink.setString("$c_temp_host:$c_temp_port");
  }
  if (CSettings.backendIsSecure.notExists) {
    await CSettings.backendIsSecure.setBool(c_temp_is_secure);
  }
  if (CSettings.serverHeaders.notExists) {
    await CSettings.serverHeaders.setStringMap(c_seerver_headers);
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

Widget snapshotCheck(AsyncSnapshot snapshot, Widget Function(Object data) x, {Widget or = cw_progress}) {
  if(snapshot.hasData) {
    return x(snapshot.data);
  }
  return or;
}