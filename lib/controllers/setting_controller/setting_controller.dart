import 'dart:async';
import 'dart:ui';

import 'package:flutter_run_cat/consts.dart';
import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/models/settings/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_impl.dart';
import 'package:flutter_run_cat/use_cases/setting_use_case/setting_use_case.dart';
import 'package:flutter_run_cat/utils/window_helper_mixin.dart';
import 'package:get/get.dart';

mixin SettingHelperMixin on Controller {
  final SettingUseCase settingUseCase = SettingUseCase(SettingImpl());

  Setting? loadSetting(int typeIndex) {
    return settingUseCase.loadSetting(typeIndex);
  }

  Future<bool> updateSetting(Setting setting) {
    return settingUseCase.updateSetting(setting);
  }

  @override
  void onInit() async {
    await settingUseCase.init();
    settingUseCase.addSettingListener(settingListener);
    super.onInit();
  }

  void disposeSetting() {
    settingUseCase.removeSettingListener(settingListener);
  }

  void settingListener(int typeIndex);
}

class SettingController extends Controller
    with SettingHelperMixin, WindonwHelperMixin {
  static SettingController find() => Get.find<SettingController>();
  
  @override
  void onInit() {
    initWindow(const Size(windowMinWidth, windowMinHeight));
    super.onInit();
  }

  @override
  void onClose() {
    disposeSetting();
    super.onClose();
  }

  @override
  void settingListener(int typeIndex) {}

  /// View
  final String generalViewID = "generalViewID";
  void updateGeneralView() {
    update([generalViewID]);
  }

  final String systemInfoViewID = "systemInfoViewID";

  void updateSystemInfoView() {
    update([systemInfoViewID]);
  }

  final String versionViewID = "versionViewID";

  void updateVersionView() {
    update([versionViewID]);
  }
}
