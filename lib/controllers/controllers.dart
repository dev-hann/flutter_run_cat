import 'dart:async';

import 'package:flutter_run_cat/controllers/setting_controller/setting_controller.dart';
import 'package:flutter_run_cat/controllers/tray_controller/tray_controller.dart';
import 'package:flutter_run_cat/controllers/version_controller/version_controller.dart';
import 'package:get/get.dart';

abstract class Controller extends GetxController {
  final Completer _loading = Completer();
  Future get loading => _loading.future;

  @override
  void onReady() {
    _loading.complete();
    super.onReady();
  }
}

Future initControllers() async {
  Get.put(SettingController());
  Get.put(TrayController());
  Get.put(VersionController());
}
