part of setting;

class SystemSetting extends Setting {
  SystemSetting({
    bool? cpuMenu,
    bool? memTray,
    bool? memMenu,
  })  : cpuMenu = cpuMenu ?? false,
        memTray = memTray ?? true,
        memMenu = memMenu ?? false;

  final bool cpuTray = true;
  bool cpuMenu;
  bool memTray;
  bool memMenu;
}
