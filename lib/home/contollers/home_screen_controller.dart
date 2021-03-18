import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/data/models/title_model.dart';

class HomeScreenController extends GetxController with SingleGetTickerProviderMixin{

  var allTitles = List<TitleModel>();
  var firstTitles = List<TitleModel>().obs;
  var secondTitles = List<TitleModel>().obs;
  String langg;

  TabController tabController;

  @override
  void onInit() async{
    super.onInit();
    // updateLang
    tabController = TabController(length: 2, vsync: this);
    updateLang();

  }
  void updateLang() async{
    SharedPreferences.getInstance().then((prefs) {
      langg = (prefs.getString('lang') ?? 'oz');
      var locale = Locale(langg);
      Get.updateLocale(locale);
      getAllTitles(langg);
    });
  }

  void getAInfo(){
    DatabaseHelper.instance.getInfo();
  }
  void getAllTitles(String lang){
    //tabController.notifyListeners();Obx(() =Obx(()Obx(()Obx(() =>  =>  => Obx(() => >
    print('keldikuuu');
    allTitles = List<TitleModel>();
    firstTitles.clear();
    secondTitles.clear();
    DatabaseHelper.instance.getAllTitles(lang).then((value){
      allTitles.addAll(value);
      allTitles.forEach((element) {
        if(element.categoryId == 1){
          firstTitles.add(element);
        }else if(element.categoryId == 2){
          secondTitles.add(element);
        }
      });
      // update();
    });
  }
}