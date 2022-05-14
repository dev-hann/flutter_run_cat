part of setting;

class SystemItem extends SettingItem {
  SystemItem({
    bool? showTray,
    bool? showMenu,
    required int typeIndex,
  })  : showTray = showTray ?? true,
        showMenu = showMenu ?? true,
        super(typeIndex);
  final bool showTray;
  final bool showMenu;

  @override
  SystemItem copyWith({
    bool? showTray,
    bool? showMenu,
  }) {
    return SystemItem(
      typeIndex: typeIndex,
      showTray: showTray ?? this.showTray,
      showMenu: showMenu ?? this.showMenu,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "typeIndex": typeIndex,
      "showMenu": showMenu,
      "showTray": showTray,
    };
  }

  factory SystemItem.fromMap(dynamic map) {
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return SystemItem(
      typeIndex: _map["typeIndex"],
      showTray: _map["showTray"],
      showMenu: _map["showMenu"],
    );
  }
}
