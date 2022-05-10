part of menu_view_model;

class SystemInfoViewModel extends MenuViewModel<GeneralSetting> {
  @override
  String get viewID => settingController.systemInfoViewID;

  @override
  List<String> get titleList => ["Hello"];

  final String cpuTitle = "CPU Usage";

  final String memTitle = "Memory Performance";

  @override
  GeneralSetting get loadSetting => GeneralSetting();
}
