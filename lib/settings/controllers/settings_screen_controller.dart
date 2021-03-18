import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';

class SettingsScreenController extends GetxController{

  var dropDownValue = 'lotincha'.obs;

  List <String> spinnerItems = [
    'lotincha',
    'kirilcha',
  ] ;

  void changeLang(String value) async{
    dropDownValue.value = value;
    switch(value){
      case 'lotincha':{
        var locale = Locale('oz');
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles('oz');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('lang', 'oz');
      };break;
      case 'kirilcha':{
        var locale = Locale('uz');
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles('uz');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('lang', 'uz');
      };break;
    }

  }

}