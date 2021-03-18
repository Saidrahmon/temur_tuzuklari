import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/app_pages.dart';
import 'package:temur_tuzuklari/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        accentColor: Color(0xFF937245),
        cursorColor: Colors.grey[400]
      ),
      initialRoute: AppPages.INITIAL_ROUTE,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Locale('oz',),
    );
  }
}
