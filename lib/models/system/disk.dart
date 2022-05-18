part of system;

class Disk extends SystemItem {
  Disk({
    required this.available,
    required this.used,
  }) : super(SystemItemType.disk.index);

  @override
  int get rawValue => ((available / total) * 100).toInt();

  final int available;
  final int used;

  int get total => available + used;

  factory Disk.fromUbuntu(List<int> data) {
    return Disk(
      available: data[0],
      used: data[1],
    );
  }
}
