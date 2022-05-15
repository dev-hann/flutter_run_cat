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

  late System system;

  final SystemUseCase _useCase = SystemUseCase(SystemImpl());

  late Timer _systemTimer;

  void _initTimer() {
    _systemTimer = Timer.periodic(_pollingDuration, (tick) {
      system = _useCase.loadSystem();
    });
  }

  bool _init = false;

  Future init() async {
    if (_init) return;
    _init = true;
    await _useCase.init();
    system = _useCase.loadSystem();
    _initTimer();
  }

  void dispose() {
    if (_systemTimer.isActive) {
      _systemTimer.cancel();
    }
  }
}
