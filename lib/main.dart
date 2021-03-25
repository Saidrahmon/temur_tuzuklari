import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/BottomSheetFor.dart';
import 'package:temur_tuzuklari/app_pages.dart';
import 'package:temur_tuzuklari/constants.dart';
import 'package:temur_tuzuklari/message.dart';

void main() {
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
        accentColor: kColorMain,
        cursorColor: Colors.grey[400],
          textTheme: TextTheme(
              display1: TextStyle(
                  color: Color(0xFF937245)
              )
          ),
          canvasColor: Colors.transparent
      ),
      initialRoute: AppPages.INITIAL_ROUTE,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Locale('oz',),
    );
  }
}
