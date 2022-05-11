part of menu_view;

class VersionView extends MenuView<VersionViewModel> {
  VersionView({Key? key})
      : super(
          key: key,
          viewModel: VersionViewModel(),
        );

  @override
  Widget contents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Version View"),
        ElevatedButton(
          onPressed: () {
            Get.dialog(Text("HEllo"));
          },
          child: Text("update"),
        )
      ],
    );
  }
}
