import 'package:get/get.dart';
import 'package:temur_tuzuklari/screens/home/contollers/home_screen_controller.dart';

class HomeScreenControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }

}