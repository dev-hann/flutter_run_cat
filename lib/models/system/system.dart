library system;

import 'package:flutter_run_cat/enums/battery_state.dart';
import 'package:flutter_run_cat/enums/system_item_type.dart';

part 'system_item.dart';
part 'battery.dart';
part 'memory.dart';

class System {
  System({
    required this.cpuList,
    required this.memory,
    required this.battery,
  });
  final List<double> cpuList;
  final Memory memory;
  final Battery battery;

  int get cpuAverage {
    final _res = cpuList.fold<double>(0, _sum) / cpuList.length;
    try {
      return _res.toInt();
    } catch (e) {
      print(e);
      return 0;
    }
  }

  double _sum(double a, double b) {
    double _checkNum(double value) {
      if (value.isNaN || value.isInfinite) return 0;
      return value;
    }

    return _checkNum(a) + _checkNum(b);
  }
}
