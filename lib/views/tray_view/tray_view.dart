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

  String label({
    required int cpu,
    required int? memory,
    required int? battery,
  }) {
    String _res = "CPU: $cpu%";
    if (memory != null) {
      _res += " Memory: $memory%";
    }
    if (battery != null) {
      _res += " Battery: $battery%";
    }
    return _res;
  }
}
