part of system;

class Battery extends SystemItem {
  Battery({
    required this.statusIndex,
    required this.capacity,
  }) : super(SystemItemType.battery.index);
  final int statusIndex;

  BattteryStatus get status => BattteryStatus.values[statusIndex];

  final int capacity;

  factory Battery.fromUbuntu(Map<String, dynamic> map) {
    if (map.isEmpty) {
    }
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return Battery(
      statusIndex: _status(_map["POWER_SUPPLY_STATUS"]),
      capacity: _capacity(_map["POWER_SUPPLY_CAPACITY"]),
    );
  }

  static int _capacity(dynamic data) {
    return int.tryParse(data) ?? -1;
  }

  static _status(dynamic data) {
    int index = 0;
    if (data == "charging") {
      index = BattteryStatus.charge.index;
    } else if (data == "Not charging") {
      index = BattteryStatus.notCharge.index;
    }
    return index;
  }

  @override
  int get rawValue => capacity;
}
