import 'dart:ui';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';
import 'package:temur_tuzuklari/services/ItemController.dart';

enum languages{
  LATIN,
  CIRILIC
}

class SettingsScreenController extends GetxController{

  String latin = 'oz';
  String cirilic = 'uz';

  var dropDownValue;


  var service = Get.put(AppService());
  List <String> spinnerItems = [
    'lotincha',
    'кирилча',

  ] ;

  @override
  void onInit() {
    this.setLanguages();
    service.readSliderValuePref();
    dropDownValue = spinnerItems[0].obs;
  }

  void setLanguages() async {
    var value = await service.getLang();
    dropDownValue.value = (value == latin) ? 'lotincha' : 'кирилча';
  }

  void changeLang(String value) async{
    dropDownValue.value = value;
    switch(value){
      case 'lotincha':{
        var locale = Locale(latin);
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles(latin);
        service.saveLang('oz');
      };break;
      case 'кирилча':{
        var locale = Locale(cirilic);
        Get.updateLocale(locale);
        Get.find<HomeScreenController>().getAllTitles(cirilic);
        service.saveLang(cirilic);
      };break;
    }
  }
}