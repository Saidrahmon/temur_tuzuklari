import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/data/models/title_model.dart';
import 'package:temur_tuzuklari/main_controller.dart';

class HomeScreenController extends GetxController with SingleGetTickerProviderMixin{

  var allTitles = List<TitleModel>();
  var firstTitles = List<TitleModel>().obs;
  var secondTitles = List<TitleModel>().obs;

  TabController tabController;

  @override
  void onInit() async{
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    getAllTitles();
  }

  void getAInfo(){
    DatabaseHelper.instance.getInfo();
  }
  void getAllTitles(){
    allTitles = List<TitleModel>();
    DatabaseHelper.instance.getAllTitles(MainController().lang.value).then((value){
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