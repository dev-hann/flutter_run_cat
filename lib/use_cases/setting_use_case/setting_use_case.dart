import 'package:flutter_run_cat/models/settings/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_repo.dart';
import 'package:flutter_run_cat/use_cases/use_case.dart';

class SettingUseCase extends UseCase<SettingRepo, Setting> {
  SettingUseCase(SettingRepo repo) : super(repo);

  Setting loadSetting() {
    return repo.loadSetting();
  }
}
