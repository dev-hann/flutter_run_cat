part of controllers;

class SettingController extends Controller {
  final SettingUseCase useCase = SettingUseCase(SettingImpl());

  @override
  void onReady() async {
    await useCase.init();
    super.onReady();
  }

  Setting loadSetting() {
    return Setting();
  }
}
