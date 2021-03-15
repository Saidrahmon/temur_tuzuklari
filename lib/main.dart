import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/app_pages.dart';
import 'package:temur_tuzuklari/home/views/SliverFor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.INITIAL_ROUTE,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
