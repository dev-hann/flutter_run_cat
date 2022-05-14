part of menu_view_model;

class SystemInfoViewModel extends CheckMenuViewModel<SystemSetting> {
  @override
  String get viewID => settingController.systemInfoViewID;

  @override
  SystemSetting get loadSetting {
    final _res = settingController.loadSetting(SettingType.systemInfo.index);
    if (_res == null) return SystemSetting();
    return _res as SystemSetting;
  }

  @override
  List<String> get titleList => [cpuTitle, memTitle];
  final String _activateText = "Activate";
  final String _menuText = "Show in the menu bar";

  /// CPU
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

  /// Memory
  final String memTitle = "Memory Performance";

  List<CheckMenuItem> get memItemList {
    final _memItem = setting.memoryItem;
    final _showTray = _memItem.showTray;
    final _showMenu = _memItem.showMenu;
    return [
      CheckMenuItem(
        check: _showTray,
        desc: _activateText,
        onTap: () {
          updateSetting((value) {
            final _item = _memItem.copyWith(showTray: !_showTray);
            value.memoryItem = _item;
          });
        },
      ),
      CheckMenuItem(
        check: _showMenu,
        desc: _menuText,
        onTap: () {
          updateSetting((value) {
            final _item = _memItem.copyWith(showMenu: !_showMenu);
            value.memoryItem = _item;
          });
        },
      ),
    ];
  }

  /// Battery
  final String batteryTitle = "Battery State";

  List<CheckMenuItem> get batteryItemList {
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
  void updateSetting(SystemItem item) {
    final _setting =setting;
    
  }
}
