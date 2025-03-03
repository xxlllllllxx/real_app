part of 'r_app.dart';

class AppApi extends ApiBase {
  List<String> access = [];
  
  String path = "/app";

  Future<bool> checkBackendConnection() async {
    try {
      var response = await post(params: {}, handleError: false);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
  
  Future<bool> checkInternetConnection() async {
    try {
      var response = await get(completeUri: Uri.parse('www.google.com'),params: {}, handleError: false);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
  
  Future<bool> validateToken(String token) async {
    try {
      var response = await post(endpoint: "/validate_token",params: {});
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (_) {
      return false;
    }
  }
}


class AppCubit extends Cubit<AppState> {
  AppCubit(
    super.initialState,
  );

  void restart() {
    emit(AppState.themeChanged);
  }
}

enum AppState {
  started,
  themeChanged,
}