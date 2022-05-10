library local_box;

import 'dart:async';

import 'package:hive/hive.dart';

part 'setting_box.dart';

abstract class LocalBox {
  String get boxID;
  late Box box;

  Future openBox() async {
    box = await Hive.openBox(boxID);
  }

  Future closebox() async {
    await box.close();
  }

  Future clearBox() async {
    await box.clear();
  }
}
