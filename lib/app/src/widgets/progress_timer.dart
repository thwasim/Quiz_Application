import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/controllers/quiz_controller.dart';
import 'package:task_of_centrric/constants.dart';

class ProgressTimer extends StatelessWidget {
  ProgressTimer({Key? key}) : super(key: key);

  final controller = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 50,
        width: 50,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: 1 - (controller.sec.value / 20),
              color: cPrimaryColor,
              backgroundColor: const Color.fromARGB(255, 113, 101, 116),
              strokeWidth: 10,
            ),
            Center(
              child: Text(
                '${controller.sec.value}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: cPrimaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
