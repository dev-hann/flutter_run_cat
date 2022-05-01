import 'package:flutter/widgets.dart';
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
    return const GetMaterialApp(
        /// Add Setting View
      home: SizedBox(),
    );
  }
}
