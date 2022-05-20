part of menu_view_model;

class RegistrationViewModel extends MenuViewModel {
  @override
  String get viewID => "RegistrationViewID";

  Setting get loadSetting =>
      settingController.loadSetting(SettingType.registration.index) ??
      RegistrationSetting(itemList: []);

  @override
  Future updateSetting(SettingItem item) async {}
}
