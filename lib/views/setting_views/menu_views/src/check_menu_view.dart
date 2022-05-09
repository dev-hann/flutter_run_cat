part of menu_view;

class CheckMenuItem {
  CheckMenuItem({
    required this.check,
    required this.desc,
    required this.onTap,
  });
  final bool check;
  final String desc;
  final VoidCallback onTap;
}

class CheckMenuView extends StatelessWidget {
  final String title;
  final double titleWidth;
  final List<CheckMenuItem> itemList;
  const CheckMenuView({
    Key? key,
    required this.title,
    required this.titleWidth,
    required this.itemList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _title(),
        ),
        _itemList(),
      ],
    );
  }

  Widget _itemList() {
    Widget _item(CheckMenuItem item) {
      return Row(
        children: [
          Checkbox(
            value: item.check,
            onChanged: (value) {
              item.onTap();
            },
          ),
          Text(item.desc)
        ],
      );
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: itemList.map(_item).toList());
  }

  Widget _title() {
    return SizedBox(
      width: titleWidth + 8,
      child: Text(
        title + " :",
      ),
    );
  }
}
