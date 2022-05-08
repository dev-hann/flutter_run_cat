part of menu_view;

class GeneralView extends MenuView<GeneralViewModel> {
  GeneralView({Key? key})
      : super(
          key: key,
          viewModel: GeneralViewModel(),
        );

  @override
  Widget contents() {
    return Column(
      children: [
        Expanded(
          child: CheckMenuView(
            title: viewModel.runnerTitle,
            titleWidth: viewModel.maxTitleWidth,
            itemList: viewModel.runnerItemList,
          ),
        ),
      ],
    );
  }
}
