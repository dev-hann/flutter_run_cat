part of local_box;

class SettingBox extends LocalBox {
  @override
  String get boxID => "SettingBox";

  late StreamSubscription _subscription;

  @override
  Future openBox() async {
    await super.openBox();
    _subscription = box.watch().listen((e) {
      notifyListeners(e.key);
    });
  }

  Future closeBox() async {
    _subscription.cancel();
    await super.closebox();
  }

  dynamic load(int typeIndex) {
    return box.get(typeIndex);
  }

  Future<bool> update(int typeIndex, Map<String, dynamic> data) async {
    try {
      await box.put(typeIndex, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  final List<Function(int typeIndex)> listenerList = [];

  void addListener(Function(int typeIndex) listener) {
    if (listenerList.contains(listener)) return;
    listenerList.add(listener);
  }

  void removeListener(Function(int typeIndex) listener) {
    listenerList.remove(listener);
  }

  void notifyListeners(int typeIndex) {
    for (final listener in listenerList) {
      listener(typeIndex);
    }
  }
}
