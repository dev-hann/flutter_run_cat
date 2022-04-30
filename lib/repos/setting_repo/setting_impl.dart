import 'package:flutter_run_cat/models/setting.dart';
import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_repo.dart';

class SettingImpl extends SettingRepo {
  @override
  Future init() async {}

  @override
  void addModelListener(ModelCallback<Setting> listener) {
  }

  @override
  void removeModelListener(ModelCallback<Setting> listener) {
  }
}
