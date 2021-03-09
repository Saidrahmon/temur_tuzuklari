import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';

class StoryScreenController extends GetxController{

  var text = ''.obs;
  String title = Get.arguments.toString();

  @override
  void onInit() {
    super.onInit();
    DatabaseHelper.instance.getStoryByTitle(title).then((value){
      text.value = value;
      // update();
    });
  }

}