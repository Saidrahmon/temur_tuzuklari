import 'package:get/get.dart';
import 'package:temur_tuzuklari/settings/controllers/settings_screen_controller.dart';
import 'package:temur_tuzuklari/settings/views/settings_screen.dart';

class SettingsScreenControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsScreenController());
  }

}