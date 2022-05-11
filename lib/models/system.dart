class System {
  System({
    required this.cpuList,
    required this.memory,
  });
  final List<double> cpuList;
  final double memory;

  int get cpuAverage {
    final _res = cpuList.fold<double>(0, _sum) / cpuList.length;
    try {
      return _res.toInt();
    } catch (e) {
      print(e);
      return 0;
    }
  }

  double _sum(double a, double b) {
    double _checkNum(double value) {
      if (value.isNaN || value.isInfinite) return 0;
      return value;
    }

    return _checkNum(a) + _checkNum(b);
  }
}
