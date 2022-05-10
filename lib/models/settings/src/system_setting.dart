part of setting;

class SystemSetting extends Setting {
  SystemSetting({
    bool? cpuMenu,
    bool? memTray,
    bool? memMenu,
  })  : cpuMenu = cpuMenu ?? false,
        memTray = memTray ?? true,
        memMenu = memMenu ?? false,
        super(SettingType.systemInfo.index);

  final bool cpuTray = true;
  bool cpuMenu;
  bool memTray;
  bool memMenu;

  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "cpuMenu": cpuMenu,
      "memTray": memTray,
      "memMenu": memMenu,
    };
  }

  factory SystemSetting.fromMap(dynamic map) {
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return SystemSetting(
      cpuMenu: _map["cpuMenu"],
      memTray: _map["memTray"],
      memMenu: _map["memMenu"],
    );
  }
}
