import 'package:flutter_run_cat/models/system.dart';

class TrayView {
  TrayView(this.iconDir);

  String iconDir;

  int _count = 0;

  String nextIcon() {
    _count++;
    final _index = _count % 5;
    return iconDir + '$_index.png';
  }

  void updateIconDir(String newIconDir) {
    iconDir = newIconDir;
    _count = 0;
  }

  String label(System system) {
    try {
      return " CPU: ${system.cpuAverage.toInt()}%  Memory: ${system.memory.toInt()}%";
    } catch (e) {
      print(e);
      return "";
    }
  }
}
