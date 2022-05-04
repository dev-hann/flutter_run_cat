import 'package:flutter_run_cat/models/system.dart';

class TrayView {
  TrayView(this.iconDir);

  String iconDir;

  int _count = 0;

  String nextIcon() {
    _count++;
    final _index = _count % 5;
    return iconDir + '$_index.svg';
  }

  void updateIconDir(String newIconDir) {
    iconDir = newIconDir;
    _count = 0;
  }

  String label(System system) {
   " CPU: ${system.cpuAverage.ceil()}%  Memory: ${system.memory.toInt()}%";
  }
}
