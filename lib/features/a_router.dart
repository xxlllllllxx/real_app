import 'package:go_router/go_router.dart';
import 'package:real_app/app/r_app.dart';
import 'package:real_app/features/modules/auth/r_auth.dart';
import 'package:real_app/helpers/a_modules.dart';
import 'package:real_app/features/modules/dashboard/r_dashboard.dart';
import 'package:real_app/helpers/d_constants.dart';
import 'package:real_app/helpers/r_helper.dart';

class RouterModule {
  final Modules module;

  RouterModule({required this.module});

  String get routerPath => module.route;
}

class MainRouter {
  static final List<RouterModule> modules = [
    RouterModule(module: locator<AppModule>()),
    RouterModule(module: locator<AuthModule>()),
    RouterModule(module: locator<DashboardModule>()),
  ];

  static get router => GoRouter(
      navigatorKey: locator<AppModule>().navigatorKey,
      routes: modules
          .map(
            (e) => GoRoute(
              path: e.routerPath,
              builder: (context, state) {
                return e.module.getUI(CWidgets.cew_main);
              },
            ),
          )
          .toList());
}
