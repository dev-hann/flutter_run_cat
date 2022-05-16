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
    );
  }

  Cpu loadCpu() {
    final data = repo.loadCpuList();
    return Cpu.fromUbuntu(data);
  }

  Battery loadBattery() {
    final data = repo.loadBattery();
    return Battery.fromUbuntu(data);
  }

  Memory loadMemory() {
    final data = repo.loadMemory();
    return Memory.fromUbuntu(data);
  }
}
