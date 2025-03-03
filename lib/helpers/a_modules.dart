part of 'r_helper.dart';

abstract class Modules {
  Future<bool> beforeInitAsync() async {
    return true;
  }
  
  Future<void> duringInitAsync() async {
    return;
  }
  
  Future<bool> afterInitAsync() async {
    return true;
  }

  Modules() {
    registerDependencies();
  }

  String get route;

  Map<CWidgets, Widget> get ui;

  void registerDependencies();

  Widget getUI(CWidgets x, {or = const SizedBox()}) {
    return ui[x] ?? or;
  }
}
