class Setting {
  Setting({
    bool? invert,
    bool? hideRunnder,
    bool? startUp,
  })  : invert = invert ?? false,
        hideRunnder = hideRunnder ?? false,
        startUp = startUp ?? true;

  final bool invert;
  final bool hideRunnder;
  final bool startUp;
}
