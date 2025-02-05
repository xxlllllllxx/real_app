import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';

class LoginUI extends StatelessWidget {
  const LoginUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
              onPressed: () async {
                String s = CSettings.selectedTheme.stringValue;
                await locator<ThemesModule>().setTheme((s == CThemes.dark.toString())
                    ? CThemes.light
                    : CThemes.dark);
                context.go("/");
              },
              icon: Icon(Icons.abc),
              label: const Text("Change Theme"))
      ],
    );
  }
}