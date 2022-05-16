import 'package:flutter_run_cat/repos/repo.dart';

abstract class SystemRepo extends Repo {
  List<List<int>> loadCpuList();
  Map<String, dynamic> loadMemory();
  Map<String, dynamic> loadBattery();
}
