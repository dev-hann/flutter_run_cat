import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  Widget _icon(IconData data, String label) {
    return Column(
      children: [
        Icon(data),
        SizedBox(height: 4),
        Text(label),
      ],
    );
  }

  Widget _generalIcon() {
    return _icon(Icons.settings, "General");
  }

  Widget _systemIcon() {
    return _icon(Icons.system_update, "System");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _generalIcon(),
        _systemIcon(),
      ],
    );
  }
}
