part of controllers;

/// TODO: appIndicator make that be able to receive raw data of Icon, no path.
/// It can be save cpu, but can be need more memory?
class TrayController extends Controller
    with ListenableSettingMixin, WindonwHelperMixin {
  final FlutterAppIndicator _indicator = FlutterAppIndicator();
  final TrayView _trayView = TrayView('assets/cat/');
  final SystemUseCase _systemUseCase = SystemUseCase(SystemImpl());

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
      MenuItem("Exit", hideWindow),
    ]);
  }

  String _label() {
    return _trayView.label(_systemUseCase.loadSystem());
  }

  /// Ticker
  final t.Ticker _iconTicker = t.Ticker();
  final t.Ticker _systemTicker = t.Ticker();
  void initTicker() {
    _iconTicker.start(
        duration: Duration(milliseconds: 200), onTick: onIconTick);
    _systemTicker.start(duration: Duration(seconds: 3), onTick: onSystemTick);
  }

  void onIconTick(_) async {
    await _indicator.setIcon(_trayView.nextIcon());
  }

  void onSystemTick(int index) async {
    await _indicator.setLabel(_label());
  }

  @override
  void settingListener(Setting setting) {
    print("updated Setting");
  }
}
