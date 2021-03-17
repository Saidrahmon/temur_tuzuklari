import 'package:get/get.dart';
import 'package:temur_tuzuklari/about_temur/bindings/about_temur_screen_controller_binding.dart';
import 'package:temur_tuzuklari/about_temur/views/about_temur_screen.dart';
import 'package:temur_tuzuklari/app_routes.dart';
import 'package:temur_tuzuklari/home/bindings/home_screen_controller_binding.dart';
import 'package:temur_tuzuklari/home/views/home_screen.dart';
import 'package:temur_tuzuklari/story/bindings/story_screen_controller_binding.dart';
import 'package:temur_tuzuklari/story/views/story_screen.dart';

class AppPages{

  static String INITIAL_ROUTE = Routes.HOME_SCREEN;

  static final routes = [
    GetPage(name: Routes.HOME_SCREEN, page: () => HomeScreen(), binding: HomeScreenControllerBinding()),
    GetPage(name: Routes.STORY_SCREEN, page: ()=> StoryScreen(), binding: StoryScreenControllerBinding()),
    GetPage(name: Routes.ABOUT_TEMUR_SCREEN, page: ()=> AboutTemurScreen(), binding: AboutTemurScreenControllerBinding())
  ];
}