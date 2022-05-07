part of controllers;

mixin ListenableSettingMixin on Controller {
  final SettingUseCase settingUseCase = SettingUseCase(SettingImpl());

  Setting get loadSetting => settingUseCase.loadSetting();

  @override
  Future onReady() async {
    super.onReady();
    await settingUseCase.init();
    settingUseCase.addModelListener(settingListener);
  }

  @override
  void onClose() {
    settingUseCase.removeModelListener(settingListener);
    super.onClose();
  }

  void settingListener(Setting setting);
}

class SettingController extends Controller
    with ListenableSettingMixin, WindonwHelperMixin {
  static SettingController find() => Get.find<SettingController>();
  // void _initWindow() {
  //   doWhenWindowReady(() {
  //     const initialSize = Size(600, 450);
  //     appWindow.minSize = initialSize;
  //     appWindow.size = initialSize;
  //     appWindow.title = "Run Cat";
  //     // appWindow.hide();
  //   });
  // }

  @override
  Future onReady() async {
    initWindow(const Size(600, 450));
    await super.onReady();
  }

  @override
  void settingListener(Setting setting) {}

  /// View
  final String menuBodyViewID = "menuBodyViewID";
  void updateMenuBodyView() {
    update([menuBodyViewID]);
  }
}
