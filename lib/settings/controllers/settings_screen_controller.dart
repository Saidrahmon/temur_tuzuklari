import 'dart:ui';

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
    switch(value){
      case 'Lotincha':{
        var locale = Locale('oz');
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles('oz');
      };break;
      case 'Kirilcha':{
        var locale = Locale('uz');
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles('uz');
      };break;
    }

  }

}