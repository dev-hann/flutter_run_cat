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
    final _item = setting.cpuItem;
    return [
      CheckMenuItem(
        check: _item.showMenu,
        desc: _menuText,
        onTap: () {
          updateSetting(_item.copyWith(showMenu: !_item.showMenu));
        },
      )
    ];
  }

  /// Memory
  final String memTitle = "Memory Performance";

  List<CheckMenuItem> get memItemList {
    final _item = setting.memoryItem;
    return [
      CheckMenuItem(
        check: _item.showTray,
        desc: _activateText,
        onTap: () {
          updateSetting(_item.copyWith(showTray: !_item.showTray));
        },
      ),
      CheckMenuItem(
        check: _item.showMenu,
        desc: _menuText,
        onTap: () {
          updateSetting(_item.copyWith(showMenu: !_item.showMenu));
        },
      ),
    ];
  }

  /// Battery
  final String batteryTitle = "Battery State";

  List<CheckMenuItem> get batteryItemList {
    final _item = setting.batteryItem;
    return [
      CheckMenuItem(
        check: _item.showTray,
        desc: _activateText,
        onTap: () {
          updateSetting(_item.copyWith(showTray: !_item.showTray));
        },
      ),
      CheckMenuItem(
        check: _item.showMenu,
        desc: _menuText,
        onTap: () {
          updateSetting(_item.copyWith(showMenu: !_item.showMenu));
        },
      ),
    ];
  }

  @override
  Future updateSetting(SettingItem item) async {
    SystemSetting _res = setting;
    SystemItem _item = item as SystemItem;
    switch (item.type) {
      case SettingItemType.runner:
      case SettingItemType.startUp:
        return;
      case SettingItemType.cpu:
        _res = _res.coypWith(cpuItem: _item);
        break;
      case SettingItemType.memory:
        _res = _res.coypWith(memoryItem: _item);
        break;
      case SettingItemType.battery:
        _res = _res.coypWith(batteryItem: _item);
        break;
      case SettingItemType.hdd:
        break;
      case SettingItemType.ethernet:
        break;
    }

    await settingController.updateSetting(_res);
    refreshSetting();
    updateView();
  }
}
