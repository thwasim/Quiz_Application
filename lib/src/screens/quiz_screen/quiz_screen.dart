import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/controllers/quiz_controller.dart';
import 'package:task_of_centrric/app/src/widgets/custom_button.dart';
import 'package:task_of_centrric/app/src/widgets/progress_timer.dart';
import 'package:task_of_centrric/app/src/widgets/question_card.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  static const routeName = '/quiz_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          // alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.black87),
            ),
            SafeArea(
              child: GetBuilder<HomeScreenController>(
                init: HomeScreenController(),
                builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Question ',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
                                children: [
                                  TextSpan(
                                      text: controller.numberOfQuestion
                                          .round()
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(color: const Color.fromARGB(255, 244, 36, 36))),
                                  TextSpan(
                                      text: '/',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: const Color.fromARGB(255, 201, 52, 52))),
                                  TextSpan(
                                      text: controller.countOfQuestion.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: const Color.fromARGB(255, 210, 50, 50))),
                                ]),
                          ),
                          ProgressTimer(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 550,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => QuestionCard(
                          questionModel: controller.questionsList[index],
                        ),
                        controller: controller.pageController,
                        itemCount: controller.questionsList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) => CustomButton(
            onPressed: () => controller.nextQuestion(), text: 'SKIP NEXT'),
      ),
    );
  }
}
