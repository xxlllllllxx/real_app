import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_app/helpers/a_http.dart';

class AppApi extends ApiBase {
  List<String> access = [];

  String path = "/app";

  Future<bool> checkBackendConnection() async {
    var response = await post(params: {});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}

class AppCubit extends Cubit<AppState> {
  AppCubit(super.initialState);

  void restart() {
    emit(AppState.themeChanged);
  }
}

enum AppState {
  started,
  themeChanged,
}
