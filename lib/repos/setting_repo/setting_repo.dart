import 'package:flutter_run_cat/models/setting.dart';
import 'package:flutter_run_cat/repos/repo.dart';

abstract class SettingRepo extends Repo<Setting> {
  
  Setting loadSetting();

  Future updateSetting(Setting value);
  
}
