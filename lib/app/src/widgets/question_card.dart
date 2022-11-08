import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/controllers/quiz_controller.dart';
import 'package:task_of_centrric/app/src/model/question_model.dart';
import 'answer_option.dart';

class QuestionCard extends StatelessWidget {
  final QuestionTypeModel questionModel;

  const QuestionCard({
    Key? key,
    required this.questionModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 25),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  questionModel.question,
                  style: const TextStyle(color: Colors.white,
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          ...List.generate(
            questionModel.options.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 14, left: 14, top: 30),
              child: Column(
                children: [
                  OptionScreen(
                      questionId: questionModel.id,
                      text: questionModel.options[index],
                      index: index,
                      onPressed: () => Get.find<HomeScreenController>()
                          .checkingAnswer(questionModel, index)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
