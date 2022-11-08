import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/controllers/quiz_controller.dart';
import 'package:task_of_centrric/app/src/widgets/custom_button.dart';

class ResultScreen extends StatelessWidget {
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
                    'ℭ𝔬𝔫𝔤𝔯𝔞𝔱𝔲𝔩𝔞𝔱𝔦𝔬𝔫',
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    '🆈🅾🆄🆁 🆂🅲🅾🆁🅴 🅸🆂',
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
          GetBuilder<HomeScreenController>(
            init: Get.find<HomeScreenController>(),
            builder: (controller) {
              return ConfettiWidget(
                confettiController: controller.confettiController,
                shouldLoop: true,
                blastDirectionality: BlastDirectionality.explosive,
              );
            },
          ),
        ],
      ),
    );
  }
}
