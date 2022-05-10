import 'package:flutter_run_cat/models/settings/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_repo.dart';

class SettingImpl extends SettingRepo {
  @override
  Future init() async {
    return;
  }

  /// it will be replaced to DB.
  GeneralSetting _tmpSetting = GeneralSetting();

  @override
  Future updateSetting(Setting value) async {
    notifyModelListeners(value);
  }

  @override
  Setting loadSetting() {
    return _tmpSetting;
  }
}
