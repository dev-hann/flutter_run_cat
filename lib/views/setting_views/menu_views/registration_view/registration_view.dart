part of menu_view;

class RegistrationView extends MenuView<RegistrationViewModel> {
  RegistrationView({Key? key})
      : super(
          key: key,
          viewModel: RegistrationViewModel(),
        );

  @override
  Widget contents() {
    return Text("RegiView");
  }
}
