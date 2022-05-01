part of controllers;

class SettingController extends Controller {
  final SettingUseCase useCase = SettingUseCase(SettingImpl());

  void _initWindow() {
    doWhenWindowReady(() {
      const initialSize = Size(600, 450);
      appWindow.minSize = initialSize;
      appWindow.size = initialSize;
      appWindow.hide();
    });
  }

  @override
  void onReady() async {
    _initWindow();
    await useCase.init();
    super.onReady();
  }

  Setting loadSetting() {
    return Setting();
  }
}
