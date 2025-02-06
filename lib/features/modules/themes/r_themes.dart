import 'package:flutter/material.dart';
import 'package:real_app/app/r_app.dart';
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/a_modules.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/a_exceptions.dart';
import 'package:real_app/helpers/r_helper.dart';

class ThemesModule extends Modules {
  ThemesModule();

  ThemeData get theme {
  print("__debug theme: ${CSettings.selectedTheme.stringValue}");
    return CSettings.selectedTheme.exists
        ? themes[CSettings.selectedTheme.stringValue]!
        : themes[CThemes.dark] ?? ThemeData.light();
  }

  Color get splashColor => theme.splashColor;

  final Map<String, ThemeData> themes = {
    CThemes.dark.toString(): ThemeData.dark(useMaterial3: true),
    CThemes.light.toString(): ThemeData.light(useMaterial3: true),
  };

  @override
  void registerDependencies() {}

  @override
  String get route => throw UnimplementedException("No APi calls.");

  @override
  Map<CWidgets, Widget> get ui => {
        CWidgets.cew_select_theme: const Placeholder(),
        CWidgets.cew_button_select_theme: const Placeholder(),
      };

  Future<void> setTheme(CThemes theme) async {
    await CSettings.selectedTheme.setString(theme.toString());
    locator<AppModule>().appCubit.restart();
  }
}
