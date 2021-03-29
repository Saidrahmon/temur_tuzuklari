import 'package:get/get.dart';
import 'package:temur_tuzuklari/screens/story/controllers/story_screen_controller.dart';

class StoryScreenControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StoryScreenController(),);
  }

}