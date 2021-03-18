import 'dart:ui';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';
import 'package:temur_tuzuklari/services/ItemController.dart';
import 'package:temur_tuzuklari/services/service_locator.dart';
import 'package:temur_tuzuklari/services/storage_service.dart';

class SettingsScreenController extends GetxController{

  //StorageService _storageService = locator<StorageService>();
  var service = Get.put(AppService());

  var dropDownValue = 'lotincha'.obs;

  @override
  void onInit() {
    service.getLang().then((value){
      dropDownValue.value = value == 'oz' ? 'lotincha' : 'kirilcha';
    });
  }


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
        service.saveLang('oz');
      };break;
      case 'kirilcha':{
        var locale = Locale('uz');
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles('uz');
        service.saveLang('uz');
      };break;
    }

  }

}