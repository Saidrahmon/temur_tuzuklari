import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';

class StoryScreenController extends GetxController{

  var text = ''.obs;

  @override
  void onInit() {
    super.onInit();
    DatabaseHelper.instance.getStoryByTitle(Get.arguments.toString()).then((value){
      text = RxString(value);
      // update();
    });
  }

}