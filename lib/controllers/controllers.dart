library controllers;

import 'dart:async';

import 'package:flutter_run_cat/models/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_impl.dart';
import 'package:flutter_run_cat/use_cases/setting_use_case/setting_use_case.dart';
import 'package:flutter_run_cat/views/tray_view/tray_view.dart';
import 'package:get/get.dart';

part 'src/setting_controller.dart';
part 'src/system_controller.dart';
part 'src/tray_controller.dart';

typedef ModelCallback<T> = Function(T value);

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
  print("!!1");
  Get.put(SettingController());
  print("!!2");
  Get.put(SystemController());
  print("!!3");
  Get.put(TrayController());
  print("!!5");
}
