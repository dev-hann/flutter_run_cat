library local_box;

import 'dart:async';
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
part 'setting_box.dart';

final environment = Platform.environment;
String get home => environment['HOME'] ?? "";
String get config => "$home/.config";

abstract class LocalBox {
  static Future init() async {
    await Hive.initFlutter("$config/flutter_run_cat/");
  }

  String get boxID;
  late Box box;

  Future openBox() async {
    box = await Hive.openBox(boxID);

    // await box.clear();
  }

  Future closebox() async {
    await box.close();
  }

  Future clearBox() async {
    await box.clear();
  }
}
