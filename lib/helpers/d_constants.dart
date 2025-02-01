// ignore_for_file: constant_identifier_names

const String c_application_name = "__APP_NAME__";

const String c_temp_host = "localhost";
const int c_temp_port = 80;
const bool c_temp_is_secure = false;

enum CWidgets {
  cew_main,

  cew_app_connection_state,

  cew_bundy,
  cew_app_connection_state_input,
}

class BackendPaths {
  static const String dashboard = "/dashboard";
  static const String app = "/app";
  static const String bundy = "/bundy";
}
