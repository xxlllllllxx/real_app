// ignore_for_file: constant_identifier_names
part of 'r_helper.dart';

const String c_application_name = "__APP_NAME__"; // set to name

const String c_temp_server_link = "localhost:8080";
const bool c_temp_is_secure = false;
const Map<String, String> c_temp_headers = {};
const String c_temp_selected_theme = 'light';
const String c_themes_light = 'light';
const String c_themes_dark = 'dark';

const String c_ok = "OK";

enum CWidgets {
  cew_main,

  cew_app_connection_state,

  cew_bundy,
  cew_app_connection_state_input,
  cew_select_theme,
  cew_button_select_theme,
}

class BackendPaths {
  static const String app = "/";
  static const String auth = "/login";
  static const String dashboard = "/dashboard";
  static const String settings = "/settings";
  static const String themes = "/themes";
  static const String bundy = "/bundy";
}

enum LogType {
  info,
  warning,
  error,
}

const Widget cw_progress = Center(child: CircularProgressIndicator());
