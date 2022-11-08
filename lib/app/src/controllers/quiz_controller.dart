import 'dart:async';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/model/question_model.dart';
import 'package:task_of_centrric/app/src/view/result_screen/result_screen.dart';
import 'package:task_of_centrric/src/screens/welcome/welcome_screen.dart';

class HomeScreenController extends GetxController {
  String name = '';

  int get countOfQuestion => _questionsList.length;
  final List<QuestionTypeModel> _questionsList = [
    QuestionTypeModel(
      id: 1,
      question: "Name the Father of the Indian Constitution ?",
      answer: 3,
      options: [
        'APJ Abdul Kalam ',
        'Jawaharlal Nehru',
        'Arun Tiwari',
        'Dr. B. R. Ambedkar'
      ],
    ),
    QuestionTypeModel(
      id: 2,
      question: "‘Gobar gas’ contains mainly which gas?",
      answer: 1,
      options: ['Hydrogen', 'Methane', 'Oxygen', 'Silicon'],
    ),
    QuestionTypeModel(
      id: 3,
      question:
          "Which is the biggest Public Sector undertaking in the country ?",
      answer: 2,
      options: ['Buses', 'IT Sector', 'Railways', 'Banking Sector'],
    ),
    QuestionTypeModel(
      id: 4,
      question: "Which ‘Englishmen was fellow of Gandhiji in South Africa?",
      answer: 1,
      options: ['John delton', 'Polak', 'Washington', 'Trumph'],
    ),
    QuestionTypeModel(
      id: 5,
      question:
          "By which number the quality of gasoline’ sample is determined?",
      answer: 3,
      options: [
        ' Mass density',
        'Cetaine Number',
        'Iodine Value',
        'By its octane number '
      ],
    ),
    QuestionTypeModel(
      id: 6,
      question:
          "Who said “I therefore want freedom immediately, this very night, before dawn if it can be had” ?",
      answer: 2,
      options: [
        'Jawahar Lal Nehru',
        'Ravindra Nath Tagore',
        'Mahatma Gandhi',
        'Bal Gangadhar Tilak'
      ],
    ),
    QuestionTypeModel(
      id: 7,
      question: "Who appoints the Chief Election Commissioner of India ?",
      answer: 3,
      options: [
        'Prime Minister',
        'Deputy Minister',
        'Chief Minister',
        'President'
      ],
    ),
    QuestionTypeModel(
      id: 8,
      question: "Where is the Sargasso sea located?",
      answer: 3,
      options: [
        'Indian Ocean',
        'Pacific Ocean',
        'South Atlantic Ocean',
        'North Atlantic Ocean'
      ],
    ),
    QuestionTypeModel(
      id: 9,
      question:
          "India becomes the 4th country to test Anti-satellite missile system named __________. ",
      answer: 2,
      options: [
        'Mission Rohini',
        'Mission Bhaskara',
        'Mission Shakti',
        'Mission OceanSat '
      ],
    ),
    QuestionTypeModel(
      id: 10,
      question:
          "How many members were newly-appointed for anti-corruption ombudsman Lokpal? ",
      answer: 1,
      options: ['6', '8', '5', '11'],
    ),
  ];

  List<QuestionTypeModel> get questionsList => [..._questionsList];

  bool _isPressed = false;

  bool get isPressed => _isPressed;

  double _numberOfQuestion = 1;

  double get numberOfQuestion => _numberOfQuestion;

  int? _selectAnswer;

  int? get selectAnswer => _selectAnswer;

  int? _correctAnswer;

  int _countOfCorrectAnswers = 0;

  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  final Map<int, bool> _questionIsAnswerd = {};

  late PageController pageController;

  Timer? _timer;

  final maxSec = 20;

  final RxInt _sec = 20.obs;

  RxInt get sec => _sec;

  final confettiController = ConfettiController();

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    animation();
    super.onInit();
  }

  double get totalScoreResult {
    return _countOfCorrectAnswers * 10 / _questionsList.length;
  }

  void checkingAnswer(QuestionTypeModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    timeStoping();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());
    update();
  }

  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer != null || _timer!.isActive) {
      timeStoping();
    }

    if (pageController.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startingTimer();
      update();

      _numberOfQuestion = pageController.page! + 2;
      update();
    }
  }

  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  Color answerColors(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return const Color.fromARGB(255, 255, 17, 0);
      }
    }
    return Colors.black12;
  }

  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void startingTimer() {
    resetTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        timeStoping();
        nextQuestion();
      }
    },);
  }

  void resetTime() => _sec.value = maxSec;

  void animation() => confettiController.play();

  void timeStoping() => _timer!.cancel();
  
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    _numberOfQuestion = 1;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(StartingScreen.routeName);
  }
}
