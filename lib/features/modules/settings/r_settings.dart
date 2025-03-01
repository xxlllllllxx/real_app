import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:real_app/helpers/r_helper.dart';

part 'd_settings.dart';

HydratedStorage settings = locator<HydratedStorage>();

Future<bool> loadSettings() {
  return throw UnimplementedException("In r_settings");
}
