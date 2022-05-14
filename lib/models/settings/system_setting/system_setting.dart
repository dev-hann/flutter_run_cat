part of setting;

class SystemSetting extends Setting {
  SystemSetting({
    bool? cpuMenu,
    SystemItem? memoryItem,
    SystemItem? batteryItem,
  })  : cpuMenu = cpuMenu ?? false,
        batteryItem =
            batteryItem ?? SystemItem(typeIndex: SystemItemType.battery.index),
        memoryItem =
            memoryItem ?? SystemItem(typeIndex: SystemItemType.memory.index),
        super(SettingType.systemInfo.index);

  final bool cpuTray = true;
  bool cpuMenu;
  SystemItem memoryItem;
  SystemItem batteryItem;
  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "cpuMenu": cpuMenu,
      "memoryItem": memoryItem.toMap(),
      "batteryItem": batteryItem.toMap(),
    };
  }

  factory SystemSetting.fromMap(dynamic map) {
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return SystemSetting(
      cpuMenu: _map["cpuMenu"],
      memoryItem: SystemItem.fromMap(_map["memoryItem"]),
      batteryItem: SystemItem.fromMap(_map["batteryItem"]),
    );
  }

  @override
  SystemSetting coypWith({
    bool? cpuMenu,
    SystemItem? memoryItem,
    SystemItem? batteryItem,
  }) {
    return SystemSetting(
      cpuMenu: cpuMenu ?? this.cpuMenu,
      memoryItem: memoryItem ?? this.memoryItem,
      batteryItem: batteryItem ?? this.batteryItem,
    );
  }
}
