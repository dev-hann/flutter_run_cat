import 'package:flutter_run_cat/enums/setting_item_type.dart';

abstract class SettingItem {
  SettingItem(this.typeIndex);
  final int typeIndex;
  SettingItemType get type => SettingItemType.values[typeIndex];
  Map<String, dynamic> toMap();

  SettingItem copyWith();
}
