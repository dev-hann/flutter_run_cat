part of setting;

class SystemSetting extends Setting {
  SystemSetting({
    SystemItem? cpuItem,
    SystemItem? memoryItem,
    SystemItem? batteryItem,
  })  : cpuItem = cpuItem ?? SystemItem.cpu(),
        memoryItem = memoryItem ?? SystemItem.memory(),
        batteryItem = batteryItem ?? SystemItem.battery(),
        super(SettingType.systemInfo.index);
  SystemItem cpuItem;
  SystemItem memoryItem;
  SystemItem batteryItem;
  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "cpuItem": cpuItem.toMap(),
      "memoryItem": memoryItem.toMap(),
      "batteryItem": batteryItem.toMap(),
    };
  }

  factory SystemSetting.fromMap(dynamic map) {
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return SystemSetting(
      cpuItem: SystemItem.fromMap(_map["cpuItem"]),
      memoryItem: SystemItem.fromMap(_map["memoryItem"]),
      batteryItem: SystemItem.fromMap(_map["batteryItem"]),
    );
  }

  @override
  SystemSetting coypWith({
    SystemItem? cpuItem,
    SystemItem? memoryItem,
    SystemItem? batteryItem,
  }) {
    return SystemSetting(
      cpuItem: cpuItem ?? this.cpuItem,
      memoryItem: memoryItem ?? this.memoryItem,
      batteryItem: batteryItem ?? this.batteryItem,
    );
  }
}
