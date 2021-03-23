import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:temur_tuzuklari/app_pages.dart';
import 'package:temur_tuzuklari/message.dart';
import 'package:temur_tuzuklari/services/service_locator.dart';

void main() {
  //setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      darkTheme: ThemeData(
        textTheme: TextTheme(
          display1: TextStyle(
            color: Colors.white
          )
        )
      ),
      theme: ThemeData(
        cursorColor: Colors.grey[400],
          textTheme: TextTheme(
              display1: TextStyle(
                  color: Color(0xFF937245)
              )
          )
      ),
      initialRoute: AppPages.INITIAL_ROUTE,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Locale('oz',),
    );
  }
}
