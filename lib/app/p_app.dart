import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_app/app/r_app.dart';
import 'package:real_app/features/modules/themes/r_themes.dart';
import 'package:real_app/features/settings/r_settings.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';

class AppConnectionState extends StatelessWidget {
  const AppConnectionState({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Connection Status");
  }
}

class AppConnectionStateUI extends StatelessWidget {
  const AppConnectionStateUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("Connection INPUT");
  }
}

class AppSplash extends StatelessWidget {
  const AppSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: locator<ThemesModule>().splashColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("This is the splashscreen"),
          ElevatedButton.icon(
              onPressed: () async {
                String s = CSettings.selectedTheme.stringValue;
                print("__debug s: ${s}");
                await locator<ThemesModule>().setTheme((s == CThemes.dark.toString())
                    ? CThemes.light
                    : CThemes.dark);
                context.go("/login");
              },
              icon: Icon(Icons.abc),
              label: const Text("Change Theme"))
        ],
      ),
    );
  }
}
