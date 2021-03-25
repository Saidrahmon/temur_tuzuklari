import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppService extends GetxController{
  var sliderValue = 17.obs;
  String lang = 'oz';
  var isRead = false.obs;
  var isBold = false.obs;


  Future<String> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = (prefs.getString('lang') ?? 'oz');
    return lang;
  }

  void saveLang(String newLang) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', newLang);
    lang = newLang;
  }

  void saveIsRead() async{
    isRead.value = !isRead.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isRead', isRead.value);
  }
  void saveIsBold() async{
    isBold.value = !isBold.value;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isBold', isBold.value);
  }

  void saveSliderValue(int shrift) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('slider', shrift);
    sliderValue.value = shrift;
  }

  void readIsReadPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isRead.value = (prefs.getBool('isRead') ?? false);
  }

  void readIsBoldPref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isBold.value = (prefs.getBool('isBold') ?? false);
  }
  void readSliderValuePref() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sliderValue.value = (prefs.getInt('slider') ?? 17);
  }
}