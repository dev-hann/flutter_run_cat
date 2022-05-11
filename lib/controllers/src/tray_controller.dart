part of controllers;

const _defaultIconDuration = Duration(milliseconds: 200);
const _defaultRevIconDuration = Duration(milliseconds: 100);

/// TODO: appIndicator make that be able to receive raw data of Icon, no path.
/// It can be save cpu, but can be need more memory?
class TrayController extends Controller
    with SettingHelperMixin, WindonwHelperMixin {
  final FlutterAppIndicator _indicator = FlutterAppIndicator();
  final TrayView _trayView = TrayView('assets/cat/');
  final SystemUseCase _systemUseCase = SystemUseCase(SystemImpl());
  System get loadSystem => _systemUseCase.loadSystem();

  SystemSetting get loadSystemSetting {
    final _res = loadSetting(SettingType.systemInfo.index);
    if (_res == null) return SystemSetting();
    return _res as SystemSetting;
  }

  GeneralSetting get loadGeneralSetting {
    final _res = loadSetting(SettingType.general.index);
    if (_res == null) return GeneralSetting();
    return _res as GeneralSetting;
  }

  @override
  Future onReady() async {
    await super.onReady();
    await _systemUseCase.init();
    await _initTray();
    initTicker();
  }

  Future _initTray() async {
    await _indicator.init(
      title: "runCat",
      iconPath: _trayView.nextIcon(),
      label: _label(),
    );
    await _indicator.setMenu([
      MenuItem("Preference", showWindow),
      MenuDivider(),
      MenuItem("Exit", closeWindow),
    ]);
  }

  String _label() {
    final _generalSetting = loadGeneralSetting;
    if (_generalSetting.hideLabel) {
      return "";
    }
    final _system = loadSystem;
    final _systemSetting = loadSystemSetting;

    return _trayView.label(
      cpu:_system.cpuAverage,
      memory: _systemSetting.memTray ? _system.memory.toInt() : null,
    );
  }

  /// Ticker
  final t.Ticker _iconTicker = t.Ticker();
  Duration _iconDuration(int cpuUsage) {
    try {
      final _generalSetting = loadGeneralSetting;
      final _isInvert = _generalSetting.invert;
      final _duration =
          _isInvert ? _defaultRevIconDuration : _defaultIconDuration;
      final _gapDuration = Duration(milliseconds: cpuUsage);
      if (_isInvert) {
        return _duration + _gapDuration;
      }
      return _duration - _gapDuration;
    } catch (e) {
      print(e);
      return _defaultIconDuration;
    }
  }

  final t.Ticker _systemTicker = t.Ticker();
  void initTicker() {
    _iconTicker.start(duration: _defaultIconDuration, onTick: onIconTick);
    _systemTicker.start(duration: Duration(seconds: 3), onTick: onSystemTick);
  }

  Future onIconTick(_) async {
    await _indicator.setIcon(_trayView.nextIcon());
  }

  Future onSystemTick(int index) async {
    final system = loadSystem;
    await _indicator.setLabel(_label());
    _iconTicker.update(duration: _iconDuration(system.cpuAverage));
  }

  @override
  void settingListener(int typeIndex) {
    final type = SettingType.values[typeIndex];
    final system = loadSystem;
    switch (type) {
      case SettingType.general:
        print(loadGeneralSetting.hideLabel);
        _iconTicker.update(duration: _iconDuration(system.cpuAverage));
        _indicator.setLabel(_label());
        break;
      case SettingType.systemInfo:
        _indicator.setLabel(_label());
        break;
    }
  }
}
