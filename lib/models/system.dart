class System {
  System({
    required this.cpuList,
    required this.memory,
  });
  final List<double> cpuList;
  final int memory;

  double get cpuAverage {
    return cpuList.fold<double>(0, (double a, double b) => a + b) /
        cpuList.length;
  }
}
