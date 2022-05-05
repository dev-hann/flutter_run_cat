part of setting_view;

class SettingViewModel {
  final SettingController settingController = SettingController.find();

  void onTapClose() {
    settingController.hideWindow();
  }

  String get menuIconViewID => settingController.menuIconViewID;
  String get menuBodyViewID => settingController.menuBodyViewID;
}
