part of controllers;

const _defaultDuration = Duration(milliseconds: 200);

/// TODO: appIndicator make that be able to receive raw data of Icon, no path.
/// It can be save cpu, but can be need more memory?
class TrayController extends Controller
    with ListenableSettingMixin, WindonwHelperMixin {
  final FlutterAppIndicator _indicator = FlutterAppIndicator();
  final TrayView _trayView = TrayView('assets/cat/');
  final SystemUseCase _systemUseCase = SystemUseCase(SystemImpl());
  System get currentSystem => _systemUseCase.loadSystem();
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
      label: _label(currentSystem),
    );
    await _indicator.setMenu([
      MenuItem("Preference", showWindow),
      MenuDivider(),
      MenuItem("Exit", closeWindow),
    ]);
  }

  String _label(System system) {
    return _trayView.label(system);
  }

  /// Ticker
  final t.Ticker _iconTicker = t.Ticker();
  Duration _iconDuration(double cpuUsage) {
    return _defaultDuration - Duration(milliseconds: cpuUsage.toInt());
  }

  final t.Ticker _systemTicker = t.Ticker();
  void initTicker() {
    _iconTicker.start(duration: _defaultDuration, onTick: onIconTick);
    _systemTicker.start(duration: Duration(seconds: 3), onTick: onSystemTick);
  }

  Future onIconTick(_) async {
    await _indicator.setIcon(_trayView.nextIcon());
  }

  Future onSystemTick(int index) async {
    final system = currentSystem;
    await _indicator.setLabel(_label(system));
    _iconTicker.update(duration: _iconDuration(system.cpuAverage));
  }

  @override
  void settingListener(Setting setting) {
    print("updated Setting");
  }
}
