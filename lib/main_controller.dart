import 'package:get/get.dart';

class MainController extends GetxController{

  var lang = 'oz'.obs;

  void changeLang(){
    lang.value = 'uz';
  }

}