part of local_box;

class SettingBox extends LocalBox {
  @override
  String get boxID => "SettingBox";

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
}
