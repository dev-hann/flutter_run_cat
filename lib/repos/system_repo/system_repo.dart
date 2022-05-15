import 'package:flutter_run_cat/repos/repo.dart';

abstract class SystemRepo extends Repo {
  List<double> loadCpuList();
  Map<String,dynamic> loadMemory();
  Map<String,dynamic> loadBattery();
}
