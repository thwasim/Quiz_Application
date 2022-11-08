import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/controllers/quiz_controller.dart';
import 'package:task_of_centrric/app/src/view/quiz_screen/quiz_screen.dart';
import 'package:task_of_centrric/app/src/widgets/custom_button.dart';
import 'package:task_of_centrric/constants.dart';

class StartingScreen extends StatelessWidget {
  StartingScreen({Key? key}) : super(key: key);

  static const routeName = '/welcome_screen';

  final _nameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  void _submit(context) {
    FocusScope.of(context).unfocus();
    if (!_formkey.currentState!.validate()) return;
    _formkey.currentState!.save();
    Get.offAndToNamed(QuizScreen.routeName);
    Get.find<HomeScreenController>().startingTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            const Text('Let\'s start Quiz,',
                style: TextStyle(color: cPrimaryColor,fontSize: 25,fontWeight: FontWeight.bold)),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Form(
              key: _formkey,
              child: GetBuilder<HomeScreenController>(
                init: Get.find<HomeScreenController>(),
                builder: (controller) => TextFormField(
                  controller: _nameController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    labelText: 'Enter User Name',
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return ("Please Enter Your Name");
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid Name");
                    }
                    return null;
                  },
                  onSaved: (String? val) {
                    controller.name = val!.trim().toUpperCase();
                  },
                  onFieldSubmitted: (_) => _submit(context),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                  width: double.infinity,
                  onPressed: () => _submit(context),
                  text: 'Lets Start Quiz'),
            ),
            const Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
