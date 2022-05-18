library system;

import 'package:flutter_run_cat/enums/battery_state.dart';
import 'package:flutter_run_cat/enums/system_item_type.dart';

part 'system_item.dart';
part 'battery.dart';
part 'memory.dart';
part 'cpu.dart';
part 'disk.dart';

class System {
  System({
    required this.cpu,
    required this.memory,
    required this.battery,
    required this.disk,
  });
  final Cpu cpu;
  final Memory memory;
  final Battery battery;
  final Disk disk;
}
