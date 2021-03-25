import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/data/models/title_model.dart';
import 'package:temur_tuzuklari/services/ItemController.dart';
class HomeScreenController extends GetxController with SingleGetTickerProviderMixin{

  var service = Get.put(AppService());

  var allTitles = List<TitleModel>();
  var firstTitles = List<TitleModel>().obs;
  var secondTitles = List<TitleModel>().obs;
  String langg;

  TabController tabController;

  @override
  void onInit() async{
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    updateLang();
  }

  void updateLang() async{
    service.getLang().then((value) {
      langg = value;
      var locale = Locale(langg);
      Get.updateLocale(locale);
      getAllTitles(langg);
    });
  }

  void getAllTitles(String lang){
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
    });
  }
}