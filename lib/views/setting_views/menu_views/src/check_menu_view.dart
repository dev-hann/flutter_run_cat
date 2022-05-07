part of menu_view;

class CheckMenuItem {
  final bool check;
  final String desc;
  final VoidCallback onTap;
  CheckMenuItem(this.check, this.desc, this.onTap);
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
      children: [
        _title(),
        _itemList(),
      ],
    );
  }

  Widget _itemList() {
    Widget _item(CheckMenuItem item) {
      return Row(
        children: [
          Radio(
            value: false,
            groupValue: 0,
            onChanged: (value) {
              print(value);
            },
          ),
          Text(item.desc)
        ],
      );
    }

    return Column(children: itemList.map(_item).toList());
  }

  Widget _title() {
    return SizedBox(
      width: titleWidth,
      child: Text(
        title + ": ",
        textAlign: TextAlign.end,
      ),
    );
  }
}
