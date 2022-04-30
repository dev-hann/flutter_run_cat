library controllers;

import 'package:flutter_run_cat/models/setting.dart';
import 'package:flutter_run_cat/repos/setting_repo/setting_impl.dart';
import 'package:flutter_run_cat/use_cases/setting_use_case/setting_use_case.dart';
import 'package:get/get.dart';

part 'src/setting_controller.dart';
part 'src/system_controller.dart';
part 'src/tray_controller.dart';

typedef ModelCallback<T> = Function(T value);

abstract class Controller extends GetxController {}

void initControllers() {}
