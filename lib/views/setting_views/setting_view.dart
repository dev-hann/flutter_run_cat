library setting_view;

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:get/get.dart';

import 'menu_views/menu_icon_view.dart';

part 'setting_view_model.dart';

class SettingView extends StatelessWidget {
  SettingView({Key? key}) : super(key: key);

  final SettingViewModel _viewModel = SettingViewModel();

  Widget _appBar() {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Run Cat"),
              ),
            ),
          ),
          CloseWindowButton(
            onPressed: _viewModel.onTapClose,
          ),
        ],
      ),
    );
  }

  Widget _menuIconView() {
    return GetBuilder<SettingController>(
      id: _viewModel.menuIconViewID,
      builder: (_) {
        return MenuIconView(
          onTapIcon: (index) {},
          selectedIndex: 0,
        );
      },
    );
  }

  Widget _menuBodyView() {
    return GetBuilder<SettingController>(
        id: _viewModel.menuBodyViewID,
        builder: (_) {
          return const MenuBodyView();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Colors.blue,
        width: 2,
        child: Column(
          children: [
            _appBar(),
            _menuIconView(),
            const Divider(),
            _menuBodyView(),
          ],
        ),
      ),
    );
  }
}
