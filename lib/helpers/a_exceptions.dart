part of 'r_helper.dart';

class ApplicationException implements Exception, ShowDialogException {
  final String message;
  final String? module;
  final String? method;
  ApplicationException(
    this.message, {
    this.module,
    this.method,
  }) {
    if (module != null) {
      print("Path: $module");
    }
    if (method != null) {
      print("Method: $method");
    }
    FlutterError.reportError(FlutterErrorDetails(
      exception: this,
      library: 'Application',
      context: ErrorDescription('There is an error in the App.'),
    ));
  }
  @override
  String toString() {
    return "ApplicationException: $message${module != null ? '\n\tmodule: [$module]' : ''}${method != null ? '\n\tmethod: [$method]' : ''}";
  }

  @override
  Future<void> showAppDialog() async {
    final context = locator<AppModule>().appContext;
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            content: Text(toString()),
            actions: <Widget>[
              TextButton(
                child: const Text(c_ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class BackendException implements Exception, ShowDialogException {
  final String message;
  final int? statusCode;
  final String? endpoint;
  final String? method;
  final Map<String, String>? params;
  BackendException(
    this.message, {
    this.endpoint,
    this.statusCode = 0,
    this.method,
    this.params,
  }) {
    if (endpoint != null) {
      print("endpoint: $endpoint");
    }
    if (method != null) {
      print("Method: $method");
    }
    if (params != null) {
      print("Params: $params");
    }
    FlutterError.reportError(FlutterErrorDetails(
      exception: this,
      library: 'Backend',
      context: ErrorDescription('There is an error in the request to backend.'),
    ));
  }

  @override
  String toString() {
    return "BackendException: $message${statusCode != null ? '\n\tcode: [$statusCode]' : ''}${endpoint != null ? '\n\tendpoint: [$endpoint]' : ''}${method != null ? '\n\tmethod: [$method]' : ''}${params != null ? '\n\tparams: [$params]' : ''}";
  }

  @override
  Future<void> showAppDialog() async {
    final context = locator<AppModule>().appContext;
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            content: Text(toString()),
            actions: <Widget>[
              TextButton(
                child: const Text(c_ok),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

class UnimplementedException implements Exception {
  final String message;
  final String? module;
  UnimplementedException(
    this.message, {
    this.module,
  }) {
    if (module != null) {
      print("Path: $module");
    }
    FlutterError.reportError(FlutterErrorDetails(
      exception: this,
      library: 'registerHelpers',
      context: ErrorDescription('while registering helpers'),
    ));
  }

  @override
  String toString() {
    return "UnimplementedException: $message${module != null ? '\n\tmodule: [$module]' : ''}";
  }
}

abstract class ShowDialogException {
  Future<void> showAppDialog();
}
