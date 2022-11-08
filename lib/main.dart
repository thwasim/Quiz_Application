import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/view/quiz_screen/quiz_screen.dart';
import 'package:task_of_centrric/app/src/view/result_screen/bindings/result_bindings.dart';
import 'package:task_of_centrric/app/src/view/result_screen/result_screen.dart';
import 'package:task_of_centrric/app/src/view/welcome/welcome_screen.dart';
import 'package:task_of_centrric/app/util/bindings_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsApp(),
      title: 'Flutter Quiz App',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: StartingScreen(),
      getPages: [
        GetPage(
          name: StartingScreen.routeName,
          page: () => StartingScreen(),
        ),
        GetPage(
          name: QuizScreen.routeName,
          page: () => const QuizScreen(),
        ),
        GetPage(
            name: ResultScreen.routeName,
            page: () => const ResultScreen(),
            binding: ResultBindings()),
      ],
    );
  }
}
