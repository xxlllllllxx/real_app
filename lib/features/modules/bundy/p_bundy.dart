import 'package:flutter/material.dart';
import 'package:real_app/features/modules/bundy/r_bundy.dart';
import 'package:real_app/helpers/r_helper.dart';

class BundyUI extends StatelessWidget {
  const BundyUI({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUNDY IS CALLED");
    return ElevatedButton(
        onPressed: () {
          locator<BundyModule>().refresh();
        },
        child: const Text("CALL EXCEPTION"));
  }
}
