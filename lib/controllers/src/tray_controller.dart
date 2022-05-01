part of controllers;

class TrayController extends Controller {
  final TrayView _trayView = TrayView();

  @override
  void onReady() {
    super.onReady();
    _trayView.init();
  }
}
