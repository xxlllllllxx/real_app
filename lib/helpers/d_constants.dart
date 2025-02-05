// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

const String c_application_name = "__APP_NAME__"; // set to name
Widget? debugWidget = const Text("__DEBUG_WIDGET__"); // set to null

const String c_temp_host = "localhost";
const int c_temp_port = 80;
const bool c_temp_is_secure = false;
const Map<String, String> c_seerver_headers = {};

const String c_ok = "OK";

enum CWidgets {
  cew_main,

  cew_app_connection_state,

  cew_bundy,
  cew_app_connection_state_input,
  cew_select_theme,
  cew_button_select_theme,
}

enum CThemes {
  light,
  dark,
}

class BackendPaths {
  static const String dashboard = "/dashboard";
  static const String app = "/app";
  static const String bundy = "/bundy";
}

enum LogType {
  info,
  warning,
  error,
}

const Widget cw_progress = Center(child: CircularProgressIndicator());
