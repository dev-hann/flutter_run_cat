import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Colors.red,
        child: Center(
          child: Text("!!!"),
        ),
      ),
    );
  }
}
