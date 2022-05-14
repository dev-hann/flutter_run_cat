import 'package:flutter_run_cat/enums/battery_state.dart';
import 'package:flutter_run_cat/models/system/system.dart';
import 'package:flutter_run_cat/repos/system_repo/system_repo.dart';
import 'package:flutter_run_cat/use_cases/use_case.dart';

class SystemUseCase extends UseCase<SystemRepo> {
  SystemUseCase(SystemRepo repo) : super(repo);

  System loadSystem() {
    return System(
      cpuList: repo.loadCpuList(),
      memory: repo.loadMemory(),
      battery: loadBattery(),
    );
  }

  Battery loadBattery() {
    final _batteryData = repo.loadBattery();
    return Battery(
      capacity: batteryCapacity(_batteryData),
      statusIndex: batteryStatus(_batteryData),
    );
  }

  int batteryStatus(Map<String, dynamic> data) {
    int _statusIndex = 0;
    final _status = data["POWER_SUPPLY_STATUS"];
    if (_status == "charging") {
      _statusIndex = BattteryStatus.charge.index;
    } else if (_status == "Not charging") {
      _statusIndex = BattteryStatus.notCharge.index;
    }
    return _statusIndex;
  }

  int batteryCapacity(Map<String, dynamic> data) {
    return int.parse(
      data["POWER_SUPPLY_CAPACITY"],
      onError: (e) {
        print(e);
        return -1;
      },
    );
  }
}
