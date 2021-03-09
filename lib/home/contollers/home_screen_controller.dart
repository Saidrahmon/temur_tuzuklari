import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';

class HomeScreenController extends GetxController{

  var titles = List<String>().obs;

  @override
  void onInit() {
    super.onInit();
    titles = List<String>().obs;
    DatabaseHelper.instance.getAllPersons().then((value) {
      titles.clear();
      titles.addAll(value);
      print(value);
      update();
    });
  }



}