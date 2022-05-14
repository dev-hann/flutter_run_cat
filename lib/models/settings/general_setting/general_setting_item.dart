import 'package:flutter_run_cat/enums/general_ite_type.dart';

abstract class GeneralItem {
  GeneralItem(this.typeIndex);
  final int typeIndex;

  GeneralItemType get type => GeneralItemType.values[typeIndex];
}

class GeneralRunnerItem extends GeneralItem {
  GeneralRunnerItem({
    bool? invert,
    bool? hideRunnder,
    bool? hideLabel,
  })  : hideLabel = hideLabel ?? false,
        invert = invert ?? false,
        hideRunnder = hideRunnder ?? false,
        super(GeneralItemType.runner.index);

  bool invert;
  bool hideRunnder;
  bool hideLabel;
  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "invert": invert,
      "hideRunnder": hideRunnder,
      "hideLabel": hideLabel,
    };
  }

  factory GeneralRunnerItem.fromMap(dynamic map) {
    final _map = Map<String, dynamic>.from(map);
    return GeneralRunnerItem(
      invert: _map['invert'],
      hideRunnder: _map['hideRunnder'],
      hideLabel: _map['hideLabel'],
    );
  }

  @override
  GeneralSetting coypWith({
    bool? invert,
    bool? hideRunnder,
    bool? hideLabel,
    bool? startUpLaunch,
    bool? checkUpdate,
  }) {
    return GeneralSetting(
      invert: invert ?? this.invert,
      hideRunnder: hideRunnder ?? this.hideRunnder,
      hideLabel: hideLabel ?? this.hideLabel,
      startUpLaunch: startUpLaunch ?? this.startUpLaunch,
      checkUpdate: checkUpdate ?? this.checkUpdate,
    );
  }
}
