part of setting;

abstract class GeneralItem extends SettingItem {
  GeneralItem(int typeIndex) : super(typeIndex);
}

class GeneralRunnerItem extends GeneralItem {
  GeneralRunnerItem({
    bool? invert,
    bool? hideRunnder,
    bool? hideLabel,
  })  : hideLabel = hideLabel ?? false,
        invert = invert ?? false,
        hideRunnder = hideRunnder ?? false,
        super(SettingItemType.runner.index);

  bool invert;
  bool hideRunnder;
  bool hideLabel;
  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "invert": invert,
      "hideRunnder": hideRunnder,
      "hideLabel": hideLabel,
    };
  }

  factory GeneralRunnerItem.fromMap(dynamic map) {
    final _map = Map<String, dynamic>.from(map);
    return GeneralRunnerItem(
      invert: _map['invert'],
      hideRunnder: _map['hideRunnder'],
      hideLabel: _map['hideLabel'],
    );
  }

  @override
  GeneralRunnerItem copyWith({
    bool? invert,
    bool? hideRunnder,
    bool? hideLabel,
  }) {
    return GeneralRunnerItem(
      invert: invert ?? this.invert,
      hideRunnder: hideRunnder ?? this.hideRunnder,
      hideLabel: hideLabel ?? this.hideLabel,
    );
  }
}

class GeneralStartUpItem extends GeneralItem {
  GeneralStartUpItem({
    bool? startUpLaunch,
    bool? checkUpdate,
  })  : startUpLaunch = startUpLaunch ?? false,
        checkUpdate = checkUpdate ?? true,
        super(SettingItemType.startUp.index);

  bool startUpLaunch;
  bool checkUpdate;

  @override
  GeneralStartUpItem copyWith({
    bool? startUpLaunch,
    bool? checkUpdate,
  }) {
    return GeneralStartUpItem(
      startUpLaunch: startUpLaunch ?? this.startUpLaunch,
      checkUpdate: checkUpdate ?? this.checkUpdate,
    );
  }

  factory GeneralStartUpItem.fromMap(dynamic map) {
    final _map = Map<String, dynamic>.from(map);
    return GeneralStartUpItem(
      startUpLaunch: _map["startUpLaunch"],
      checkUpdate: _map["checkUpdate"],
    );
  }
  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "startUpLaunch": startUpLaunch,
      "checkUpdate": checkUpdate,
    };
  }
}
