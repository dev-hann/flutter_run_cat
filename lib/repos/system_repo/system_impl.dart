import 'package:flutter_run_cat/services/system_service/system_service.dart';

import 'system_repo.dart';

class SystemImpl extends SystemRepo {
  final SystemService _service = SystemService();

  @override
  Future init() async {}

  @override
  Map<String, dynamic> loadBattery() {
    return _service.loadBattery();
  }

  @override
  List<List<int>> loadCpuList() {
    return _service.loadCpu();
  }

  @override
  Map<String, dynamic> loadMemory() {
    return _service.loadMemory();
  }
}
