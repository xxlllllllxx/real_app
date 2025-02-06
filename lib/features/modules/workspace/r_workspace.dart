import 'package:flutter/widgets.dart';
import 'package:real_app/helpers/a_modules.dart';
import 'package:real_app/helpers/d_constants.dart';

part 'p_workspace.dart';

class WorkspaceModule extends Modules {
  @override
  void registerDependencies() {
  }

  @override
  String get route => "/workspace";

  @override
  Map<CWidgets, Widget> get ui => throw UnimplementedError();
  
}