part of menu_view;

class SystemInfoView extends MenuView<SystemInfoViewModel> {
  SystemInfoView({Key? key})
      : super(
          key: key,
          viewModel: SystemInfoViewModel(),
        );

  @override
  Widget contents() {
    return Text("Hello");
  }
}
