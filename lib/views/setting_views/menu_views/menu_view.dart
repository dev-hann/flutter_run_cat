library menu_view;

import 'package:flutter/material.dart';
import 'package:flutter_run_cat/controllers/setting_controller/setting_controller.dart';
import 'package:get/get.dart';

import 'menu_view_model.dart';
part 'src/check_menu_view.dart';
part 'src/general_view.dart';
part 'src/system_info_view.dart';
part 'src/version_view.dart';

abstract class MenuView<T extends MenuViewModel> extends StatelessWidget {
  const MenuView({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final T viewModel;
  Widget contents();

  Widget loadingView() {
    return SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      id: viewModel.viewID,
      builder: (_) {
        if (viewModel.isLoading) return loadingView();
        return contents();
      },
    );
  }
}
