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
        startUpLaunch = startUpLaunch ?? true;

  bool invert;
  bool hideRunnder;
  bool startUpLaunch;
  bool checkUpdate;
}
