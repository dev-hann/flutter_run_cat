import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/widgets.dart';

mixin WindonwHelperMixin {
  void initWindow(Size size) {
    doWhenWindowReady(() async {
      final _w = appWindow;
      _w.size = size;
      _w.minSize = size;
      _w.hide();
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
