import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/services/storage_service.dart';
import 'package:get/get.dart';

class StorageServiceImpl extends StorageService{

  var sliderValue = 16.obs;
  String lang = 'oz';

  @override
  Future<int> getShrift() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sliderValue.value = (prefs.getInt('slider') ?? 16);
    return sliderValue.value;
  }

  @override
  void saveShrift(int shrift) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('slider', shrift);
    sliderValue.value = shrift;
  }

  @override
  Future<String> getLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = (prefs.getString('lang') ?? 'oz');
    return lang;
  }

  @override
  void saveLang(String newLang) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', newLang);
    lang = newLang;
  }
}