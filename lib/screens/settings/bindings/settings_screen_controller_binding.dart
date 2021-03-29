import 'package:get/get.dart';
import 'package:temur_tuzuklari/screens/settings/controllers/settings_screen_controller.dart';

class SettingsScreenControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsScreenController());
  }

}