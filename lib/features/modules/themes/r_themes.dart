import 'package:flutter/material.dart';
import 'package:real_app/app/r_app.dart';
import 'package:real_app/features/modules/settings/r_settings.dart';
import 'package:real_app/helpers/r_helper.dart';

class ThemesModule extends Modules {
  ThemesModule();
  
  final Map<String, ThemeData> themes = {
    c_themes_dark: ThemeData.dark(useMaterial3: true),
    c_themes_light: ThemeData.light(useMaterial3: true),
  };

  ThemeData get theme {
    return CSettings.selectedTheme.exists
        ? themes[CSettings.selectedTheme.stringValue] ?? ThemeData.light()
        : themes[c_themes_dark] ?? ThemeData.light();
  }

  Color get splashColor => theme.splashColor;


  @override
  void registerDependencies() {}

  @override
  String get route => "/themes";

  @override
  Map<CWidgets, Widget> get ui => {
        CWidgets.cew_select_theme: const Placeholder(),
        CWidgets.cew_button_select_theme: const Placeholder(),
      };

  Future<void> setTheme(String theme) async {
    await CSettings.selectedTheme.setString(theme.toString());
    locator<AppModule>().appCubit.restart();
  }
}
