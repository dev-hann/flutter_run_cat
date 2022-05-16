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
      children: [
        Text("Run Cat"),
        Text("Version : ${viewModel.appVersion}"),
        Text("new version : ${viewModel.newVersion}"),
        Text("License : MIT"),
        ElevatedButton(
          onPressed: viewModel.onTapGit,
          child: Text("Github"),
        )
      ],
    );
  }
}
