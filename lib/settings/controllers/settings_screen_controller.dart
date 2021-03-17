import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';
import 'package:temur_tuzuklari/main_controller.dart';

class SettingsScreenController extends GetxController{

  var dropDownValue = 'Lotincha'.obs;

  List <String> spinnerItems = [
    'Lotincha',
    'Kirilcha',
  ] ;

  void changeLang(String value) async{
    dropDownValue.value = value;
    MainController().changeLang();
  }

}