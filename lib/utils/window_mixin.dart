import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';

mixin WindonwMixin {
  void initWindow(Size size) {
    doWhenWindowReady(() {
      final _w = appWindow;
      _w.size = size;
    });
  }

  void closeWindow() {
    appWindow.close();
  }

  void hideWindow() {
    appWindow.hide();
  }

  void showWindow() {
    appWindow.show();
  }
}
