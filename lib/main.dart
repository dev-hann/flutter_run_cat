import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_run_cat/views/setting_views/setting_view.dart';
import 'package:get/get.dart';

import 'controllers/controllers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initControllers();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: darkGrey,
        iconTheme: const IconThemeData(
          color: lightGrey,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: lightGrey,
          displayColor: lightGrey,
        ),
      ),
      home: const SettingView(),
    );
  }
}

const darkGrey = Color(0xFF1b2226);
const grey = Color(0xFF8699a6);
const lightGrey = Color(0xFF8a939f);
const darkBlue = Color(0xFF30414b);
const brown = Color(0xFF9c9486);
