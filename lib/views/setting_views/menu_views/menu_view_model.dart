library menu_view_model;

import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/enums/setting_type.dart';
import 'package:flutter_run_cat/models/settings/setting.dart';
import 'menu_view.dart';

part 'src/general_view_model.dart';
part 'src/system_info_view_model.dart';

abstract class MenuViewModel<T extends Setting> {
  MenuViewModel() {
    _init();
  }
  final SettingController settingController = SettingController.find();

  List<String> get titleList;
  double maxTitleWidth = 0;
  String get viewID;

  late T setting;

  T get loadSetting;

  bool _loadig = true;
  bool get isLoading => _loadig;

  void _init() async {
    await settingController.isLoading;
    setting = loadSetting;
    maxTitleWidth = computeMaxTitleWidth(titleList);
    _loadig = false;
    settingController.update([viewID]);
  }

  void updateSetting(Function(T value) callback) {
    callback(setting);
    settingController.updateSetting(setting);
    settingController.update([viewID]);
  }

  double computeMaxTitleWidth(List<String> titleList) {
    double res = 0;

    final TextPainter _tp = TextPainter(textDirection: TextDirection.ltr);

    for (final title in titleList) {
      _tp.text = TextSpan(text: title);
      _tp.layout();
      final _tmpWitdh = _tp.width;
      res = max(res, _tmpWitdh);
    }

    return res;
  }
}
