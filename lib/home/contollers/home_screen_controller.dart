import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/data/models/title_model.dart';

class HomeScreenController extends GetxController with SingleGetTickerProviderMixin{

  var allTitles = List<TitleModel>();
  var firstTitles = List<TitleModel>().obs;
  var secondTitles = List<TitleModel>().obs;

  TabController tabController;

  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: 2, vsync: this);

    allTitles = List<TitleModel>();
    DatabaseHelper.instance.getAllTitles().then((value){
      allTitles.addAll(value);
      allTitles.forEach((element) {
        if(element.categoryId == 1){
          firstTitles.add(element);
        }else if(element.categoryId == 2){
          secondTitles.add(element);
        }
      });
      update();
    });
  }

  void getAInfo(){
    DatabaseHelper.instance.getInfo();
  }
}