part of setting;

class GeneralSetting extends Setting {
  GeneralSetting({
    bool? invert,
    bool? hideRunnder,
    bool? startUpLaunch,
    bool? checkUpdate,
  })  : checkUpdate = checkUpdate ?? true,
        invert = invert ?? false,
        hideRunnder = hideRunnder ?? false,
        startUpLaunch = startUpLaunch ?? true,
        super(SettingType.general.index);

  bool invert;
  bool hideRunnder;

  bool startUpLaunch;
  bool checkUpdate;

  Map<String, dynamic> toMap() {
    return {
      "invert": invert,
      "hideRunnder": hideRunnder,
      "startUpLaunch": startUpLaunch,
      "checkUpdate": checkUpdate,
    };
  }

  factory GeneralSetting.fromMap(dynamic map) {
    final _map = Map<String, dynamic>.from(map);
    return GeneralSetting(
      invert: _map['invert'],
      hideRunnder: _map['hideRunnder'],
      startUpLaunch: _map['startUpLaunch'],
      checkUpdate: _map['checkUpdate'],
    );
  }
}
