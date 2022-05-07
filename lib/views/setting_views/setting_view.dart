import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_run_cat/controllers/controllers.dart';
import 'package:flutter_run_cat/theme.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'setting_view_model.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateSettingView();
  }
}

class _StateSettingView extends State<SettingView>
    with SingleTickerProviderStateMixin {
  final SettingViewModel _viewModel = SettingViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.init(this);
  }

  Widget _appBar() {
    Widget _titleBar() {
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
      Widget _tab(Tuple2<IconData, String> tuple) {
        return Tab(
          text: tuple.item2,
          icon: Icon(tuple.item1),
        );
      }

      return SizedBox(
        width: _viewModel.menuLength * 100,
        child: Theme(
          data: ThemeData(
            highlightColor: Colors.transparent,
          ),
          child: TabBar(
            labelColor: lightBlue,
            unselectedLabelColor: lightGrey,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            controller: _viewModel.tabController,
            indicator: BoxDecoration(
              color: lightGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            tabs: _viewModel.iconList.map(_tab).toList(),
          ),
        ),
      );
    }

    return Material(
      elevation: 2,
      color: black,
      // shadowColor: lightBlack,
      child: Column(
        children: [
          _titleBar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _menuIconView(),
          ),
        ],
      ),
    );
  }

  Widget _menuBodyView() {
    return GetBuilder<SettingController>(
      id: _viewModel.menuBodyViewID,
      builder: (_) {
        return SizedBox();
      },
    );
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
            const Divider(height: 0),
            _menuBodyView(),
          ],
        ),
      ),
    );
  }
}
