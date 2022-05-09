library menu_view_model;

import 'dart:math';

import 'package:flutter/painting.dart';
import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/models/setting.dart';

import 'menu_view.dart';

part 'src/general_view_model.dart';

abstract class MenuViewModel {
  final SettingController settingController = SettingController.find();

  String get viewID;

  void updateView() {
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
