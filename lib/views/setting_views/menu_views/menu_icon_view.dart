library menu_view;

import 'package:flutter/material.dart';
import 'package:flutter_run_cat/main.dart';
import 'package:tuple/tuple.dart';

part 'menu_body_view.dart';

class MenuIconView extends StatelessWidget {
  MenuIconView({
    Key? key,
    required this.selectedIndex,
    required this.onTapIcon,
  }) : super(key: key);
  final int selectedIndex;
  final Function(int index) onTapIcon;

  final List<Tuple2<IconData, String>> iconList = [
    const Tuple2(Icons.settings, "General"),
    const Tuple2(Icons.run_circle, "System"),
  ];

  final Color _selectedColor = Colors.red;

  Widget _icon(IconData data, String label, bool selected) {
    return Column(
      children: [
        Icon(data, color: selected ? _selectedColor : null),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: selected ? _selectedColor : null),
        ),
      ],
    );
  }

  Widget _item(int index) {
    final tuple = iconList[index];
    return GestureDetector(
      onTap: () {
        onTapIcon(index);
      },
      child: _icon(
        tuple.item1,
        tuple.item2,
        selectedIndex == index,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        for (int index = 0; index < iconList.length; index++) _item(index),
      ],
    );
  }
}
