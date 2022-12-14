import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/controllers/quiz_controller.dart';
import 'package:task_of_centrric/app/src/view/result_screen/controller/result_controller.dart';
import 'package:task_of_centrric/app/src/widgets/custom_button.dart';

class ResultScreen extends GetView<ResultController> {
  const ResultScreen({Key? key}) : super(key: key);

  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: GetBuilder<HomeScreenController>(
              init: Get.find<HomeScreenController>(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'β­π¬π«π€π―ππ±π²π©ππ±π¦π¬π«',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'ππΎππ ππ²πΎππ΄ πΈπ',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '${controller.totalScoreResult.round()} /10',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.red,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      onPressed: () => controller.startAgain(),
                      text: 'Start Again'),
                ],
              ),
            ),
          ),
          ConfettiWidget(
            confettiController: controller.confettiController,
            shouldLoop: true,
            blastDirectionality: BlastDirectionality.explosive,
          )
        ],
      ),
    );
  }
}
