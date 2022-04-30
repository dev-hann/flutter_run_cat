part of controllers;

class TrayController extends Controller {
  final TrayView _trayView = TrayView();

  void onInit() {
    print("@#@##@#");
    onReady();
  }

  @override
  void onReady() {
    super.onReady();
    print("@#@#@#@#12122121");
    _trayView.init();
  }
}
