import 'package:flutter/material.dart';
import 'package:real_app/features/modules/bundy/r_bundy.dart';
import 'package:real_app/helpers/d_strings.dart';
import 'package:real_app/helpers/r_helper.dart';

class DashbordUI extends StatelessWidget {
  const DashbordUI({super.key});

  @override
  Widget build(BuildContext context) {
    print("DASHBOARD");
    return Column(
      children: [
        const Text("DASHBOARD"),
        locator<BundyModule>().getUI(CWidgets.bundy, context),
      ],
    );
  }
}
