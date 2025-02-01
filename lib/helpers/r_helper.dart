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
  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (details.exception is ApplicationException) {
      return const Center(child: Text(""));
    }
    return const Center(child: Text("Something went wrong!"));
  };

  HydratedBloc.storage = await loadStorage(locator);
  if (CSettings.backendLink.stringValue.isEmpty) {
    await CSettings.backendLink.setString("$c_temp_host:$c_temp_port");
  }
  if (CSettings.backendIsSecure.boolValue) {
    await CSettings.backendIsSecure.setBool(c_temp_is_secure);
  }

  return;
}
