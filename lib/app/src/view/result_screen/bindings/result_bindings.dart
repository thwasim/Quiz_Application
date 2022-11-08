import 'package:get/get.dart';
import 'package:task_of_centrric/app/src/view/result_screen/controller/result_controller.dart';

class ResultBindings extends Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => ResultController());
  }

}