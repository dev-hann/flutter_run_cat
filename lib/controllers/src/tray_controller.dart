part of controllers;

class TrayController extends Controller with ListenableSettingMixin {
  final SystemTray _tray = SystemTray();
  final TrayView _trayView = TrayView();

  @override
  Future onReady() async {
    await super.onReady();
    await _trayView.init();
    await _initTray();
    initTicker();
  }

  Future _initTray() async {
    await _tray.initSystemTray(
      title: "runCat",
      iconPath: 'assets/cat/0.png',
    );
    _tray.setContextMenu([
      MenuItem(label: 'Show', onClicked: onTapShow),
      MenuItem(label: 'Hide', onClicked: onTapHide),
      MenuItem(label: 'Exit', onClicked: () {}),
    ]);
  }

  void onTapShow() {
    appWindow.show();
  }

  void onTapHide() {
    appWindow.hide();
  }

  void onChangedSetting(Setting setting) {}

  /// Ticker
  Timer? _timer;
  void initTicker() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(milliseconds: 300), onTick);
  }

  void onTick(Timer timer) async {
    final index = timer.tick % 5;
    await _tray.setImage('assets/cat/$index.png');
  }

  @override
  void settingListener(Setting setting) {
    print("updated Setting");
  }
}
