import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';

class AboutTemurScreenController extends GetxController{

  var text = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print('on Init');
    DatabaseHelper.instance.getInfo().then((value) => {
      text.value = value.text
    });
  }

  void getAInfo(){
    DatabaseHelper.instance.getInfo();
  }
}