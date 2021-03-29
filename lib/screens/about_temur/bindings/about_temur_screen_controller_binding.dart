import 'package:get/get.dart';
import 'package:temur_tuzuklari/screens/about_temur/controllers/about_temur_screen_controller.dart';

class AboutTemurScreenControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AboutTemurScreenController());
  }

}