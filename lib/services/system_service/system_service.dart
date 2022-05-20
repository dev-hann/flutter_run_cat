import 'dart:io';

const cpuPath = "/proc/stat";
const memPath = "/proc/meminfo";
const batteryPath = "/sys/class/power_supply/BAT0/uevent";

class SystemService {
  List<List<int>> loadCpu() {
    final List<List<int>> _res = [];
    final _itemList =
        _loadDataList(cpuPath).where((e) => e.contains("cpu")).toList();

    for (final item in _itemList) {
      final dataList =
          item.split(" ").sublist(1).map((e) => int.tryParse(e) ?? 0).toList();
      _res.add(dataList);
    }
    return _res;
  }

  Map<String, dynamic> loadMemory() {
    try {
      final _res = <String, dynamic>{};
      final _itemList = _loadDataList(memPath);
      for (final item in _itemList) {
        final _dataList = item.split(":");
        if (_dataList.length < 2) continue;
        final label = _dataList[0];
        final data = _dataList[1].replaceAll("kB", "").trim();
        _res[label] = data;
      }
      return _res;
    } catch (e) {
      return {};
    }
  }

  Map<String, dynamic> loadBattery() {
    try {
      final _res = <String, dynamic>{};
      final _itemList = _loadDataList(batteryPath);
      for (final item in _itemList) {
        final _split = item.split("=");
        if (_split.length < 2) continue;
        final label = _split[0];
        final data = _split[1];
        _res[label] = data;
      }
      return _res;
    } catch (e) {
      return {};
    }
  }

  /// return [available, used];
  List<int> loadDisk() {
    try {
      final _res = Process.runSync("df", ["--total"]);
      final stdOut = _res.stdout.toString();
      final List<String> _dataList = stdOut.split("\n");
      String _data = _dataList[_dataList.length - 2];
      while (_data.contains("  ")) {
        _data = _data.replaceAll("  ", " ");
      }
      return _data
          .split(" ")
          .sublist(2, 4)
          .map((e) => int.tryParse(e) ?? 0)
          .toList();
    } catch (e) {
      print(e);
      return [0, 0];
    }
  }

  /// TODO:handel error
  List<String> _loadDataList(String path) {
    return File(path).readAsStringSync().split("\n");
  }
}
