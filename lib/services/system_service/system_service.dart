import 'dart:io';

const cpuPath = "/proc/stat";
const memPath = "/proc/meminfo";
const batteryPath = "/sys/class/power_supply/BAT0/uevent";

class SystemService {
  final _lastActivateList = <double>[];
  final _lastTotalList = <double>[];
  List<double> loadCpu() {
    try {
      final _res = <double>[];
      final _data = _loadData(cpuPath);
      final _list = _data.split('\n').where((e) => e.contains("cpu")).toList();
      if (_lastActivateList.isEmpty || _lastTotalList.isEmpty) {
        _lastActivateList.addAll(List.filled(_list.length, 0.0));
        _lastTotalList.addAll(List.filled(_list.length, 0.0));
      }
      for (int index = 0; index < _list.length; index++) {
        final cpu = _list[index];
        final usageList = cpu.replaceAll("  ", " ").split(" ");
        final parseList = usageList.sublist(1).map((e) {
          return double.parse(e);
        }).toList();
        final double _activate = parseList[0] + parseList[2];
        final double _total = _activate + parseList[3];
        final _usage = (_activate - _lastActivateList[index]) /
            (_total - _lastTotalList[index]);
        _res.add(_usage * 100);
        _lastActivateList[index] = _activate;
        _lastTotalList[index] = _total;
      }
      return _res;
    } catch (e) {
      print(e);
      return [0];
    }
  }

  double loadMemory() {
    try {
      final _data = _loadData(memPath);
      final _list = _data.split('\n');
      int _total = 0;
      int _avail = 0;
      for (final item in _list) {
        final _itemList = item.split(":");
        if (_itemList[0] == "MemTotal") {
          final _value = _itemList[1].replaceAll("kB", "").trim();
          _total = int.parse(_value);
        } else if (_itemList[0] == "MemAvailable") {
          final _value = _itemList[1].replaceAll("kB", "").trim();
          _avail = int.parse(_value);
        }
      }
      return (_total - _avail) / _total * 100;
    } catch (e) {
      print(e);
      return 0;
    }
  }

  Map<String, dynamic> loadBattery() {
    try {
      final _res = <String, dynamic>{};
      final _data = _loadData(batteryPath);
      final _itemList = _data.split("\n");
      for (final item in _itemList) {
        final _split = item.split("=");
        if (_split.length < 2) continue;
        final label = _split[0];
        final data = _split[1];
        _res[label] = data;
      }
      return _res;
    } catch (e) {
      print(e);
      return {};
    }
  }

  /// TODO:handel error
  String _loadData(String path) {
    return File(path).readAsStringSync();
  }
}
