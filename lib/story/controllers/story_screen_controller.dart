import 'dart:convert';

import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/data/models/key_value.dart';

class StoryScreenController extends GetxController{

  var text = ''.obs;
  var title = ''.obs;
  int id = Get.arguments;
  List<KeyValue> keyValues;

  @override
  void onInit() {
    super.onInit();
    DatabaseHelper.instance.getStoryById(id).then((value){
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

}