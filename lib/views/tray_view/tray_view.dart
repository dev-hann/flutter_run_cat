import 'package:system_tray/system_tray.dart';

class TrayView {
  final SystemTray _systemTray = SystemTray();


 final menu = [
    MenuItem(label: 'Show', onClicked: (){}),
    MenuItem(label: 'Hide', onClicked: (){}),
    MenuItem(label: 'Exit', onClicked: (){}),
  ];

  Future init() async {
    await _systemTray.initSystemTray(
      title: "Title",
      iconPath: 'assets/cat/0.png',
    );
    _systemTray.setContextMenu(menu);
    print("@#@##@#@#aaaaaaa");
  }
}
