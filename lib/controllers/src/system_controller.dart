part of controllers;

class SystemController extends Controller with ListenableSettingMixin {
  Setting _currentSetting = Setting();

  @override
  Future onReady() async {
    await super.onReady();
    _currentSetting = settingUseCase.loadSetting();
  }

  @override
  void settingListener(Setting setting) {
    _currentSetting = setting;
  }

  System loadSystem() {
    print(_currentSetting);
    return System();
  }
}
