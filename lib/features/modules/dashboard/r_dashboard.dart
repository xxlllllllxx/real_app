import 'package:flutter/material.dart';
import 'package:real_app/helpers/c_modules.dart';
import 'package:real_app/features/modules/dashboard/p_dashboard.dart';
import 'package:real_app/helpers/d_constants.dart';

class DashboardModule extends Modules {
  @override
  String get route => "/";
  DashboardModule(super.module);

  @override
  void registerDependencies() {}

  @override
  Map<CWidgets, Widget> get ui => {CWidgets.cew_main: const DashbordUI()};
}
