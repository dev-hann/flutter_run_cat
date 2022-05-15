part of system;

abstract class SystemItem {
  SystemItem(this.typeIndex);
  final int typeIndex;

  SystemItemType get type => SystemItemType.values[typeIndex];

  /// raw value;
  int get rawValue;

  /// if show false , retrun null
  int? value(bool show) {
    if (!show) return null;
    return rawValue;
  }
}
