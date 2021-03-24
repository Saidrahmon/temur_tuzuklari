import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/about_temur/controllers/about_temur_screen_controller.dart';
import 'package:temur_tuzuklari/constants.dart';

class AboutTemurScreen extends GetView<AboutTemurScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner){
          return <Widget>[
            SliverAppBar(
              title: Text(kTitleApp.tr),
              floating: true,
              backgroundColor: Color(0xFF937245),
              //pinned: true,
              snap: true,
            )
          ];
        },
        body: Center(
          child: Obx(() {
            return Markdown(
              styleSheet: MarkdownStyleSheet(
                  p: TextStyle(fontSize: 20)
              ),
              selectable: true,
              data: controller.text.value,
            );
          }),
        ),
      ),
    );
  }
}
