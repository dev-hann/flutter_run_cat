import 'package:flutter_run_cat/models/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_repo.dart';
import 'package:flutter_run_cat/use_cases/use_case.dart';

class SettingUseCase extends UseCase<Setting> {
  SettingUseCase(SettingRepo repo) : super(repo);
}
