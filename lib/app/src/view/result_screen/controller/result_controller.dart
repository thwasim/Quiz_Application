import 'package:confetti/confetti.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final  confettiController=ConfettiController();
  @override
  void onInit() {
   
    super.onInit();
   
    confettiController.play();

  
  }
  // @override
  // void dispose() {
   
  //   super.dispose();
  //   confettiController.dispose();
  // }
}