library setting;

import 'package:flutter_run_cat/enums/setting_type.dart';

part 'src/general_setting.dart';
part 'src/system_setting.dart';

abstract class Setting {
  Setting(this.typeIndex);
  final int typeIndex;
  SettingType get type => SettingType.values[typeIndex];

  static Setting fromMap(dynamic map) {
    final _typeIndex = map["typeIndex"];
    assert(_typeIndex != null);
    final _type = SettingType.values[_typeIndex as int];
    switch (_type) {
      case SettingType.general:
        return GeneralSetting.fromMap(map);
      case SettingType.systemInfo:
        return SystemSetting.fromMap(map);
    }
  }

  Map<String, dynamic> toMap();
}
