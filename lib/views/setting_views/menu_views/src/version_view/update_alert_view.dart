import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateAlertView extends StatelessWidget {
  const UpdateAlertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Update Alert"),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text("Update"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: false);
                  },
                  child: Text("No"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
