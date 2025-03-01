import 'package:flutter/material.dart';
import 'package:real_app/features/modules/bundy/r_bundy.dart';
import 'package:real_app/helpers/r_helper.dart';

part 'p_dashboard.dart';

class DashboardModule extends Modules {
  @override
  String get route => "/dashboard";
  DashboardModule();

  @override
  void registerDependencies() {}

  @override
  Map<CWidgets, Widget> get ui => {CWidgets.cew_main: const DashbordUI()};
}
