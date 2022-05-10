part of menu_view_model;

class SystemInfoViewModel extends MenuViewModel<SystemSetting> {
  @override
  String get viewID => settingController.systemInfoViewID;

  @override
  List<String> get titleList => [cpuTitle, memTitle];
  final String _activateText = "Activate";
  final String _menuText = "Show in the menu bar";

  final String cpuTitle = "CPU Usage";

  List<CheckMenuItem> get cpuItemList {
    return [
      CheckMenuItem(
        check: setting.cpuMenu,
        desc: _menuText,
        onTap: () {
          updateSetting((value) {
            value.cpuMenu = !value.cpuMenu;
          });
        },
      )
    ];
  }

  final String memTitle = "Memory Performance";

  List<CheckMenuItem> get memItemList {
    return [
      CheckMenuItem(
        check: setting.memTray,
        desc: _activateText,
        onTap: () {
          updateSetting((value) {
            value.memTray = !value.memTray;
          });
        },
      ),
      CheckMenuItem(
        check: setting.memMenu,
        desc: _menuText,
        onTap: () {
          updateSetting((value) {
            value.memMenu = !value.memMenu;
          });
        },
      ),
    ];
  }

  @override
  SystemSetting get loadSetting => SystemSetting();
}
