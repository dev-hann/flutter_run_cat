import 'dart:io';

import 'package:flutter_run_cat/consts.dart';
import 'package:flutter_run_cat/databases/local_box.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_repo.dart';

class SettingImpl extends SettingRepo {
  final SettingBox _box = SettingBox();
  @override
  Future init() async {
    await _box.openBox();
    // await _box.clearBox();
  }

  @override
  Future<bool> updateSetting(int typeIndex, Map<String, dynamic> data) async {
    // notifyListeners(typeIndex);
    return _box.update(typeIndex, data);
  }

  @override
  dynamic loadSetting(int typeIndex) {
    return _box.load(typeIndex);
  }

  final List<Function(int typeIndex)> listenerList = [];

  @override
  void addSettingListener(Function(int typeIndex) listener) {
    _box.addListener(listener);
  }

  @override
  void removeSettingListener(Function(int typeIndex) listener) {
    _box.removeListener(listener);
  }

  void notifyListeners(int typeIndex) {
    for (final listener in listenerList) {
      listener(typeIndex);
    }
  }

  @override
  void updateStartUpLaunch(bool value) async {
    final file = File("$config/autostart/flutter_run_cat.desktop");
    if (file.existsSync()) {
      if (!value) {
        file.delete();
      }
    } else {
      if (value) {
        file.writeAsString(autoStartDeskTop);
      }
    }
  }
}
