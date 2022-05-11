part of setting;

class GeneralSetting extends Setting {
  GeneralSetting({
    bool? invert,
    bool? hideRunnder,
    bool? hideLabel,
    bool? startUpLaunch,
    bool? checkUpdate,
  })  : hideLabel = hideLabel ?? false,
        checkUpdate = checkUpdate ?? true,
        invert = invert ?? false,
        hideRunnder = hideRunnder ?? false,
        startUpLaunch = startUpLaunch ?? true,
        super(SettingType.general.index);

  bool invert;
  bool hideRunnder;
  bool hideLabel;

  bool startUpLaunch;
  bool checkUpdate;

  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "invert": invert,
      "hideRunnder": hideRunnder,
      "hideLabel": hideLabel,
      "startUpLaunch": startUpLaunch,
      "checkUpdate": checkUpdate,
    };
  }

  factory GeneralSetting.fromMap(dynamic map) {
    final _map = Map<String, dynamic>.from(map);
    return GeneralSetting(
      invert: _map['invert'],
      hideRunnder: _map['hideRunnder'],
      hideLabel: _map['hideLabel'],
      startUpLaunch: _map['startUpLaunch'],
      checkUpdate: _map['checkUpdate'],
    );
  }
}
