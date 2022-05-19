library local_box;

import 'dart:async';
import 'dart:io';

import 'package:hive/hive.dart';

part 'setting_box.dart';

abstract class LocalBox {
  String get boxID;
  late Box box;

  final environment = Platform.environment;
  String get home => environment['HOME'] ?? "";
  Future openBox() async {
    box = await Hive.openBox(boxID, path: "$home/.config/flutter_run_cat/");
    await box.clear();
  }

  Future closebox() async {
    await box.close();
  }

  Future clearBox() async {
    await box.clear();
  }
}
