part of system;

class Memory extends SystemItem {
  Memory({
    required this.memTotal,
    required this.memFree,
    required this.memAvailable,
  }) : super(SystemItemType.memnory.index);

  int memTotal;
  int memFree;
  int memAvailable;

  factory Memory.fromUbuntu(dynamic map) {
    final Map<String, dynamic> _map = Map<String, dynamic>.from(map);
    return Memory(
      memTotal: _parse(_map["MemTotal"]),
      memFree: _parse(_map["MemFree"]),
      memAvailable: _parse(_map["MemAvailable"]),
    );
  }

  static _parse(dynamic data) {
    try {
      return int.tryParse(data);
    } catch (e) {
      print(e);
      return 0;
    }
  }

  @override
  int get rawValue => ((memTotal - memAvailable) / memTotal * 100).toInt();
}
