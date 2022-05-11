class System {
  System({
    required this.cpuList,
    required this.memory,
  });
  final List<double> cpuList;
  final double memory;

  int get cpuAverage {
    try {
      return cpuList.fold<double>(0, (double a, double b) => a + b) ~/
              cpuList.length;
    } catch (e) {
      return 0;
    }
  }
}
