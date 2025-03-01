part of 'r_helper.dart';
abstract class Modules {

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
