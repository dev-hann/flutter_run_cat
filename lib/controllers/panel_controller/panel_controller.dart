import 'dart:ui';

import 'package:flutter_run_cat/consts.dart';
import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/models/runner/runner.dart';
import 'package:flutter_run_cat/models/settings/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_impl.dart';
import 'package:flutter_run_cat/use_cases/setting_use_case/setting_use_case.dart';
import 'package:flutter_run_cat/utils/setting_helper.dart';
import 'package:flutter_run_cat/utils/window_helper.dart';
import 'package:get/get.dart';

class PanelController extends Controller {
  static PanelController find() => Get.find<PanelController>();

  final SettingHelper _settingHelper = SettingHelper();
  final WindowHelper _windowHelper = WindowHelper();
  final SettingUseCase _useCase = SettingUseCase(SettingImpl());
  @override
  void onInit() async {
    await _settingHelper.init();
    await _useCase.init();
    _windowHelper.initWindow(const Size(windowMinWidth, windowMinHeight));
    super.onInit();
  }

  Setting? loadSetting(int typeIndex) {
    return _settingHelper.loadSetting(typeIndex);
  }

  void updateStartUpLaunch(bool value) {
    _settingHelper.updateStartUpLaunch(value);
  }

  List<Runner> loadRunnerList() {
    return _useCase.loadRunnerList();
  }

  Future updateRunner(Runner runner) async {
    await _useCase.updateRunner(runner);
  }

  Future removeRunner(Runner runner) async {
    await _useCase.removeRunner(runner);
  }

  Future updateSetting(Setting setting) async {
    _settingHelper.updateSetting(setting);
  }

  void hideWindow() {
    _windowHelper.hideWindow();
  }
}