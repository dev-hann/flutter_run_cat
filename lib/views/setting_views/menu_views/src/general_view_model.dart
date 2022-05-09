part of menu_view_model;

class GeneralViewModel extends MenuViewModel {
  GeneralViewModel() {
    _init();
  }

  final setting = Setting();

  @override
  String get viewID => settingController.generalViewID;

  final String runnerTitle = "Runner";

  List<CheckMenuItem> get runnerItemList {
    return [
      CheckMenuItem(
        check: setting.invert,
        desc: "Invert (The lighter CPU loads, the faster th speed)",
        onTap: () {
          setting.invert = !setting.invert;
          updateView();
        },
      ),
    ];
  }

  final String startUpTitle = "Startup";

  List<CheckMenuItem> get startUpItemList {
    return [
      CheckMenuItem(
        check: setting.startUp,
        desc: "Launch RunCat at Login",
        onTap: () {
          setting.startUp = !setting.startUp;
          updateView();
        },
      )
    ];
  }

  double maxTitleWidth = 0;

  void _init() {
    maxTitleWidth = computeMaxTitleWidth([runnerTitle, startUpTitle]);
  }
}
