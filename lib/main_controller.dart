import 'package:get/get.dart';

class MainController extends GetxController{


  RxList content = RxList();
  var lang = 'oz'.obs;

  void changeLang(){
    lang.value = 'uz';


  }

}