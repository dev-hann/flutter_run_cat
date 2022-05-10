library local_box;

import 'package:hive/hive.dart';

part 'setting_box.dart';

abstract class LocalBox {
  String get boxID;
  late Box box;

  Future openBox() async {
    box = await Hive.openBox(boxID);
  }
}
