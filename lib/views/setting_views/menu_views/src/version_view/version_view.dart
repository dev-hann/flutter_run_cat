part of menu_view;

class VersionView extends MenuView<VersionViewModel> {
  VersionView({Key? key})
      : super(
          key: key,
          viewModel: VersionViewModel(),
        );

  Widget _updateDesc() {
    return Text(viewModel.updateDesc);
  }

  @override
  Widget contents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Version View"),
        Text("current version : ${viewModel.appVersion}"),
        Text("new version : ${viewModel.newVersion}"),
        ElevatedButton(
          onPressed: viewModel.onTapUpdate,
          child: Text("update"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _updateDesc(),
        contents(),
      ],
    );
  }
}
