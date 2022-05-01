part of controllers;

class TrayController extends Controller {
  final SystemTray _tray = SystemTray();
  final TrayView _trayView = TrayView();

  @override
  void onReady() async {
    super.onReady();
    await _tray.initSystemTray(
      title: "runCat",
      iconPath: 'assets/cat/0.png',
    );
    _tray.setContextMenu(menu);
    _trayView.init();
  }

  final menu = [
    MenuItem(label: 'Show', onClicked: () {}),
    MenuItem(label: 'Hide', onClicked: () {}),
    MenuItem(label: 'Exit', onClicked: () {}),
  ];
}
