import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class StoryScreen extends GetView<StoryScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Temur Tuzuklari'), backgroundColor: Color(0xFF937245),),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner){
          return <Widget>[
            SliverAppBar(
              title: Text('Title'),
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
              selectable: true,
              data: this.controller.text.value,
              onTapLink: (text, href, title) => {
                showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.white,
                  builder: (context) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                        controller.getDescByKey(href)),
                  ),
                ),
              },
            );
          }),
        ),
      ),
    );
  }
}


