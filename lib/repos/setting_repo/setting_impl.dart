import 'package:flutter_run_cat/models/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_repo.dart';

class SettingImpl extends SettingRepo {
  @override
  Future init() async {
    return;
  }

  /// it will be replaced to DB.
  Setting _tmpSetting = Setting();

  @override
  Future updateSetting(Setting value) async {
    _tmpSetting = value;
    notifyModelListeners(value);
  }

  @override
  Setting loadSetting() {
    return _tmpSetting;
  }
}
