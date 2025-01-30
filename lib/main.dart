import 'package:flutter/material.dart';
import 'package:real_app/r_api.dart';
import 'package:real_app/r_helper.dart';
import 'package:real_app/r_providers.dart';
import 'package:real_app/r_ui.dart';
import 'package:real_app/settings.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHelpers(locator);
  await registerApis(locator);
  await registerProviders(locator);
  await registerUis(locator);
  await loadSettings(locator);
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    );
  }
}