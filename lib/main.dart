import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:real_app/r_local_storage.dart';
import 'package:real_app/r_api.dart';
import 'package:real_app/helpers/r_helper.dart';
import 'package:real_app/r_providers.dart';
import 'package:real_app/r_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerHelpers(locator);
  await registerApis(locator);
  await registerProviders(locator);
  await registerUis(locator);
  HydratedBloc.storage = await loadStorage(locator);
  await loadSettings(locator);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}
