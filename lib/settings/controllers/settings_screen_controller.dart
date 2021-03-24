import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';
import 'package:temur_tuzuklari/services/ItemController.dart';
import 'package:temur_tuzuklari/services/service_locator.dart';
import 'package:temur_tuzuklari/services/storage_service.dart';

class SettingsScreenController extends GetxController{

  var service = Get.put(AppService());

  var dropDownValue = 'lotincha'.obs;

  @override
  void onInit() {
    service.getLang().then((value){
      dropDownValue.value = value == 'oz' ? 'lotincha' : 'кирилча';
    });
    service.readSliderValuePref();
  }

  List <String> spinnerItems = [
    'lotincha',
    'кирилча',
  ] ;

  void changeLang(String value) async{
    dropDownValue.value = value;
    switch(value){
      case 'lotincha':{
        var locale = Locale('oz');
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles('oz');
        service.saveLang('oz');
      };break;
      case 'кирилча':{
        var locale = Locale('uz');
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles('uz');
        service.saveLang('uz');
      };break;
    }

  }
  void changeSliderValue(int newValue){
    service.saveSliderValue(newValue);
  }

}