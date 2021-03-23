import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/data/models/key_value.dart';
import 'package:temur_tuzuklari/main_controller.dart';
import 'package:temur_tuzuklari/services/ItemController.dart';

class StoryScreenController extends GetxController{

  var service = Get.put(AppService());

  var text = ''.obs;
  var title = ''.obs;
  int id = Get.arguments[0];
  List<KeyValue> keyValues;
  List<int> chapters = List();
  var sliderValue = 16.obs;
  String lang = Get.arguments[1];
  ScrollController hideButtonController;
  var isVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    getStoryById(id);
    getAllChapters();
    service.getShrift().then((value){
      sliderValue.value = value;
    });
    service.readIsReadPref();
    service.readIsBoldPref();
    hideButtonController = ScrollController();

  }

  void getStoryById(int id){
    DatabaseHelper.instance.getStoryById(id, lang).then((value){
      text.value = value.text;
      title.value = value.title;
      var keyValueJson = jsonDecode(value.desc) as List;
      keyValues = keyValueJson.map((keyValueJson) => KeyValue.fromJson(keyValueJson)).toList();
    });
  }

  String getDescByKey(String key){
    String oldKey = key.replaceAll(RegExp(r"(\#\_ftn)"), '');
    String desc = '';
    keyValues.forEach((element) {
      if(element.key == oldKey){
        desc = element.value;
      }
    });
    return desc;
  }

  void getAllChapters(){
    DatabaseHelper.instance.getAllTitles(MainController().lang.value).then((value){
      value.forEach((element) {
        chapters.add(element.chapter);
      });
    });
  }

  void getNextStory(){
    int index = -1;
    for(int i = 0; i < chapters.length; i++){
      if(chapters[i] == id){
        index = i;
      }
    }
    if(index < chapters.length-1){
      index += 1;
      print(index);
      id = chapters[index];
      getStoryById(id);
    }
  }

  void getPrevStory(){
    int index = -1;
    for(int i = 0; i < chapters.length; i++){
      if(chapters[i] == id){
        index = i;
      }
    }
    if(index > 0){
      index -= 1;
      print(index);
      id = chapters[index];
      getStoryById(id);
    }
  }

  void changeSliderValue(int newValue){
    sliderValue.value = newValue;
    service.saveShrift(newValue);
  }
}