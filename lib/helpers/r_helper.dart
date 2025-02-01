import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:real_app/helpers/d_exceptions.dart';
import 'package:real_app/helpers/df_bloc_observer.dart';
import 'package:sqflite/sqflite.dart';

part 'df_logs.dart';

GetIt locator = GetIt.instance;

Future<void> registerHelpers(GetIt locator) async {
  // CSettings.databaseName.setString(s_databaseName);
  Bloc.observer = const AppBlocObserver();
  ErrorWidget.builder = (FlutterErrorDetails details) {
    if (details.exception is ApplicationException) {
      return const Center(child: Text(""));
    }
    return const Center(child: Text("Something went wrong!"));
  };
  return;
}
