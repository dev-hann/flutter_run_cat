part of setting;

class RegistrationSettingItem extends SettingItem {
  RegistrationSettingItem({
    required this.name,
    required this.pathList,
  }) : super(SettingItemType.registration.index);

  final String name;
  final List<String> pathList;

  @override
  RegistrationSettingItem copyWith({
    String? name,
    List<String>? pathList,
  }) {
    return RegistrationSettingItem(
      name: name ?? this.name,
      pathList: pathList ?? this.pathList,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "pathList": pathList,
    };
  }

  factory RegistrationSettingItem.fromMap(dynamic map) {
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return RegistrationSettingItem(
      name: _map["name"],
      pathList: List<String>.from(_map["pathList"]),
    );
  }
}
