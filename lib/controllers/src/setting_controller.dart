part of controllers;

mixin SettingListenerMixin on Controller {
  final SettingUseCase settingUseCase = SettingUseCase(SettingImpl());

  @override
  void onReady() async {
    await settingUseCase.init();
    settingUseCase.addModelListener(settingListener);
    super.onReady();
  }

  void settingListener(Setting value);
}

class SettingController extends Controller with SettingListenerMixin {
  
  

  @override
  void settingListener(Setting value) {}


}
