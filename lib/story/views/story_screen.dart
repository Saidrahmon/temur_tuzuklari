import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';

class StoryScreen extends GetView<StoryScreenController> {

  // final StoryScreenController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Temur Tuzuklari'), backgroundColor: Color(0xFF937245),),
      body: Center(
        child: Obx(() {
          return Markdown(
            selectable: true,
            data: this.controller.text.value,
            onTapLink: (text, href, title) => {
              print(href)
            },
            //onTapLink: (dd) {},
          );
        }),
      ),
    );
  }
}
