part of setting;

class GeneralSetting extends Setting {
  GeneralSetting({
    GeneralRunnerItem? runnerItem,
    GeneralStartUpItem? startUpItem,
  })  : runnerItem = runnerItem ?? GeneralRunnerItem(),
        startUpItem = startUpItem ?? GeneralStartUpItem(),
        super(SettingType.general.index);
  final GeneralRunnerItem runnerItem;
  final GeneralStartUpItem startUpItem;

  @override
  GeneralSetting coypWith({
    GeneralRunnerItem? runnerItem,
    GeneralStartUpItem? startUpItem,
  }) {
    return GeneralSetting(
      runnerItem: runnerItem ?? this.runnerItem,
      startUpItem: startUpItem ?? this.startUpItem,
    );
  }

  factory GeneralSetting.fromMap(dynamic map) {
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return GeneralSetting(
      runnerItem: GeneralRunnerItem.fromMap(_map["runnerItem"]),
      startUpItem: GeneralStartUpItem.fromMap(_map["startUpItem"]),
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "runnerItem": runnerItem.toMap(),
      "startUpItem": startUpItem.toMap(),
    };
  }
}
