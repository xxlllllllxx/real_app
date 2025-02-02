import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/d_exceptions.dart';
import 'package:real_app/helpers/df_bloc_observer.dart';
import 'package:real_app/helpers/r_local_storage.dart';

part 'df_logs.dart';

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
