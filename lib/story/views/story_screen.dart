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
      appBar: AppBar(),
      body: Center(
        child: Obx(() {
          return Markdown(
            data: this.controller.text.value,
          );
        }),
      ),
    );
  }
}
