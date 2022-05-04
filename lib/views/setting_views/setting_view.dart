import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'menu_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  Widget _appBar() {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Run Cat"),
              ),
            ),
          ),
          CloseWindowButton(
            onPressed: () {
              appWindow.close();
              appWindow.hide();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Colors.blue,
        width: 2,
        child: Column(
          children: [
            _appBar(),
            MenuView(),
            Divider(),
            Text("@#@#@:w"),
          ],
        ),
      ),
    );
  }
}
