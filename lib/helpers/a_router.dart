part of 'r_helper.dart';

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
                return FutureBuilder(
                  future: e.module.beforeInitAsync(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data ?? true) {
                        e.module.duringInitAsync().then((_) {
                          e.module.afterInitAsync();
                        });
                        return e.module.getUI(CWidgets.cew_main);
                      } else {
                        return e.module.getUI(CWidgets.cew_init_failed);
                      }
                    }
                    return cw_progress;
                  },
                );
              },
            ),
          )
          .toList());
}
