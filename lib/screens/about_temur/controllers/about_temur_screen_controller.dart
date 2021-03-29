import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';

class AboutTemurScreenController extends GetxController{

  var text = ''.obs;
  String lang;

  @override
  void onInit() {
    super.onInit();
    lang = Get.arguments;
    DatabaseHelper.instance.getInfo(lang).then((value) => {
      text.value = value.text
    });
  }
}