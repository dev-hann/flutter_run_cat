import 'dart:async';

import 'package:flutter_run_cat/models/system/system.dart';
import 'package:flutter_run_cat/repos/system_repo/system_impl.dart';
import 'package:flutter_run_cat/use_cases/system_use_case/system_use_case.dart';

const _pollingDuration = Duration(seconds: 1);

class SystemHelper {
  static final SystemHelper _systemHelper = SystemHelper._internal();

  factory SystemHelper() {
    return _systemHelper;
  }
  SystemHelper._internal();

  System? _historySystem;
  System? _system;
  System get system {
    if (_system == null) {
      _loadSystem();
    }
    return _system!;
  }

  int cpuUsage() {
    if (_system == null || _historySystem == null) return 0;
    return _system!.cpu.computeUsage(_historySystem!.cpu);
  }

  void _loadSystem() {
    _historySystem = _system;
    _system = _useCase.loadSystem();
  }

  final SystemUseCase _useCase = SystemUseCase(SystemImpl());

  late Timer _systemTimer;

  void _initTimer() {
    _systemTimer = Timer.periodic(_pollingDuration, (tick) {
      _loadSystem();
    });
  }

  bool _init = false;

  Future init() async {
    if (_init) return;
    _init = true;
    await _useCase.init();
    _loadSystem();
    _initTimer();
  }

  void dispose() {
    if (_systemTimer.isActive) {
      _systemTimer.cancel();
    }
  }
}
