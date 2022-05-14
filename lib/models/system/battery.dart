part of system;

class Battery {
  Battery({
    required this.statusIndex,
    required this.capacity,
  });
  final int statusIndex;

  BattteryStatus get status => BattteryStatus.values[statusIndex];

  final int capacity;
}
