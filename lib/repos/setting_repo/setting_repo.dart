import 'package:flutter_run_cat/repos/repo.dart';

abstract class SettingRepo extends Repo {
  void addSettingListener(Function(int typeIndex) listener);

  void removeSettingListener(Function(int typeIndex) listener);

  dynamic loadSetting(int typeIndex);

  Future<bool> updateSetting(int typeIndex, Map<String, dynamic> data);

  void updateStartUpLaunch(bool value);
}
