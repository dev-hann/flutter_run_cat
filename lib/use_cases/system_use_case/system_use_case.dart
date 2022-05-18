import 'package:flutter_run_cat/enums/battery_state.dart';
import 'package:flutter_run_cat/models/system/system.dart';
import 'package:flutter_run_cat/repos/system_repo/system_repo.dart';
import 'package:flutter_run_cat/use_cases/use_case.dart';

class SystemUseCase extends UseCase<SystemRepo> {
  SystemUseCase(SystemRepo repo) : super(repo);

  System loadSystem() {
    return System(
      cpu: loadCpu(),
      memory: loadMemory(),
      battery: loadBattery(),
      disk: loadDisk(),
    );
  }

  Cpu loadCpu() {
    final data = repo.loadCpuList();
    return Cpu.fromUbuntu(data);
  }

  Battery loadBattery() {
    final data = repo.loadBattery();
    if (data.isEmpty) {
      // is DeskTop
      return Battery(
        statusIndex: BattteryStatus.disCharge.index,
        capacity: 100,
      );
    }

    return Battery.fromUbuntu(data);
  }

  Memory loadMemory() {
    final data = repo.loadMemory();
    return Memory.fromUbuntu(data);
  }

  Disk loadDisk() {
    final data = repo.loadDisk();
    if (data.length != 2) {
      return Disk(available: 0, used: 0);
    }
    return Disk.fromUbuntu(data);
  }
}
