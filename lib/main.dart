import 'package:flutter/material.dart';
import 'package:flutter_run_cat/theme.dart';
import 'package:flutter_run_cat/views/setting_views/setting_view.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controllers/controllers.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  initControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: customThemeData,
      home: const SettingView(),
    );
  }
}
