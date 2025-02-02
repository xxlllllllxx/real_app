import 'package:flutter/material.dart';
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/c_modules.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/d_exceptions.dart';

class ThemesModule extends Modules {
  ThemesModule();

  ThemeData get theme => CSettings.selectedTheme.exists? themes[CSettings.selectedTheme.stringValue]! : ThemeData.light();

  final Map<String, ThemeData> themes = {
    
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
}
