part of system;

class Cpu extends SystemItem {
  Cpu(this.coreList) : super(SystemItemType.cpu.index);
  final List<Core> coreList;
  @override
  int get rawValue => 0;

  int get activate {
    return coreList.map((e) => e.activate).fold(0, (a, b) => a + b);
  }

  int get total {
    return coreList.map((e) => e.total).fold(0, (a, b) => a + b);
  }

  int computeUsage(Cpu other) {
    return ((activate - other.activate) / (total - other.total) * 100).toInt();
  }

  factory Cpu.fromUbuntu(List<List<int>> stat) {
    return Cpu(stat.map((e) => Core.fromUbuntu(e)).toList());
  }
}

class Core {
  Core(
    this.user,
    this.nice,
    this.system,
    this.idle,
    this.iowait,
    this.irq,
    this.softirq,
  );
  final int user;
  final int nice;
  final int system;
  final int idle;
  final int iowait;
  final int irq;
  final int softirq;

  int get activate => user + system;
  int get total => activate + idle;
  factory Core.fromUbuntu(List<int> stat) {
    return Core(stat[0], stat[1], stat[2], stat[3], stat[4], stat[5], stat[6]);
  }
}
