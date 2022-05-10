part of controllers;

mixin SettingHelperMixin on Controller {
  final SettingUseCase settingUseCase = SettingUseCase(SettingImpl());

  Setting? loadSetting(int typeIndex) {
    return settingUseCase.loadSetting(typeIndex);
  }

  Future<bool> updateSetting(Setting setting) {
    return settingUseCase.updateSetting(setting);
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
    with SettingHelperMixin, WindonwHelperMixin {
  static SettingController find() => Get.find<SettingController>();

  final Completer _completer = Completer();
  Future get isLoading => _completer.future;

  @override
  Future onReady() async {
    initWindow(const Size(windowMinWidth, windowMinHeight));
    await super.onReady();
    _completer.complete();
  }

  @override
  void settingListener(int typeIndex) {
  }

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
