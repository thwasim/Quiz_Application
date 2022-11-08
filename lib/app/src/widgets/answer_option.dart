import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/controllers/quiz_controller.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({
    Key? key,
    required this.text,
    required this.index,
    required this.questionId,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final int index;
  final int questionId;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: Get.find<HomeScreenController>(),
      builder: (controller) => InkWell(
        onTap:
            controller.checkIsQuestionAnswered(questionId) ? null : onPressed,
        child: Card(
          color: controller.answerColors(index),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    text: '${index + 1}.    ',
                    style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
                    children: [
                      TextSpan(
                        text: text,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 57, 3, 75)),
                      ),
                    ],
                  ),
                ),
                if (controller.checkIsQuestionAnswered(questionId) &&
                    controller.selectAnswer == index)
                  Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.zero,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: controller.answerColors(index),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                        shape: BoxShape.circle),
                    child: Icon(
                      controller.getIcon(index),
                      color: Colors.white,
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
