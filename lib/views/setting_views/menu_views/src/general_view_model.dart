part of menu_view_model;

class GeneralViewModel extends MenuViewModel {
  GeneralViewModel() {
    _init();
  }

  final setting = Setting();

  @override
  String get viewID => settingController.generalViewID;

  final String runnerTitle = "Runner";

  List<CheckMenuItem> get runnerItemList => _menuList[runnerTitle] ?? [];

  final String startUpKey = "Startup";

  Map<String, List<CheckMenuItem>> get _menuList {
    return {
      runnerTitle: [
        CheckMenuItem(
          check: setting.invert,
          desc: "Inver Desc",
          onTap: () {},
        ),
      ]
    };
  }

  double maxTitleWidth = 0;

  void _init() {
    maxTitleWidth = computeMaxTitleWidth([runnerTitle, startUpKey]);
  }
}
