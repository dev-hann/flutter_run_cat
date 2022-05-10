part of controllers;

mixin ListenableSettingMixin on Controller {
  final SettingUseCase settingUseCase = SettingUseCase(SettingImpl());

  Setting? loadSetting(int typeIndex) {
    return settingUseCase.loadSetting(typeIndex);
  }

  @override
  Future onReady() async {
    super.onReady();
    await settingUseCase.init();
    settingUseCase.addSettingListener(settingListener);
  }

  @override
  void onClose() {
    settingUseCase.removeSettingListener(settingListener);
    super.onClose();
  }

  void settingListener(int typeIndex);
}

class SettingController extends Controller
    with ListenableSettingMixin, WindonwHelperMixin {
  static SettingController find() => Get.find<SettingController>();

  @override
  Future onReady() async {
    initWindow(const Size(windowMinWidth, windowMinHeight));
    await super.onReady();
  }

  void updateSetting(Setting setting) {
    print("Update Setting");
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
}
