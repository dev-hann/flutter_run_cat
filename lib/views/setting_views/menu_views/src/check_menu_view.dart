part of menu_view;

class CheckMenuItem {
  CheckMenuItem(this.check, this.desc, this.onTap);
  final bool check;
  final String desc;
  final VoidCallback onTap;
}

class CheckMenuView extends StatelessWidget {
  const CheckMenuView({
    Key? key,
    required this.title,
    required this.itemList,
  }) : super(key: key);
  final String title;
  final List<CheckMenuItem> itemList;

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
