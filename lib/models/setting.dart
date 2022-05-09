class Setting {
  Setting({
    bool? invert,
    bool? hideRunnder,
    bool? startUp,
  })  : invert = invert ?? false,
        hideRunnder = hideRunnder ?? false,
        startUp = startUp ?? true;

  bool invert;
  bool hideRunnder;
  bool startUp;
}
