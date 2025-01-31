import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class RouterModule {
  final String routerPath = "/";
  final String type = "default";
  final Widget main = const Placeholder();
  final Widget buttonUI = throw UnimplementedError();
}

class MainRouter {
  static final List<RouterModule> modules = [];

  static get router => GoRouter(
      routes: modules
          .map(
            (e) => GoRoute(
              path: e.routerPath,
              builder: (context, state) {
                return e.main;
              },
            ),
          )
          .toList());
}
