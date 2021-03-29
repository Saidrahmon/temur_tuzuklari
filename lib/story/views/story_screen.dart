import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';
import '../../constants.dart';
import 'build_bottom_navigation_bar.dart';
import 'desc_widget.dart';

class StoryScreen extends GetView<StoryScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BuildBottomNavigationBar(controller: controller,) ,
        body: Stack(
            children : [
              Container(color: Colors.white,),
              NestedScrollView(
                  controller: controller.hideButtonController,
                  headerSliverBuilder: (BuildContext context, bool inner){
                    return <Widget>[
                      SliverAppBar(
                        title: Text(kTitleApp.tr),
                        backgroundColor: Color(0xFF937245),
                        floating: true,
                        snap: true,
                      ),
                    ];
                  },
                  body: Stack(
                    children: [
                      Obx(() =>
                          Container(
                            color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
                          ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Obx((){
                                    return Container(
                                      padding: EdgeInsets.only(top: 20, left: 15, right: 20),
                                      child: Text(
                                          this.controller.title.value,
                                          style: Theme.of(context).textTheme.display1.copyWith(
                                              color: controller.service.isRead.value ? kColorMain.withOpacity(0.5) : kColorMain.withOpacity(0.8),
                                            fontSize: (controller.service.sliderValue.value + 6).toDouble(),
                                            fontWeight: controller.service.isBold.value ? FontWeight.bold : FontWeight.normal
                                          )
                                      ),
                                    );
                                  }
                                  ),
                                ),
                              ],
                            ),
                            Obx(() {
                              return Stack(
                                children: [
                                  Markdown(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    styleSheet: MarkdownStyleSheet(
                                        p: TextStyle(
                                            fontSize: controller.service.sliderValue.value.toDouble(),
                                            color: controller.service.isRead.value ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.8),
                                            fontWeight: controller.service.isBold.value ? FontWeight.w500 : FontWeight.normal
                                        )
                                    ),
                                    selectable: true,
                                    data: controller.text.value,
                                    onTapLink: (text, href, title) => {
                                      showAsBottomSheetForDesc(context, href)
                                      // showModalBottomSheet(
                                      //     context: context,
                                      //     builder: (BuildContext context){
                                      //       return BuildModalBottomSheetForDesc(controller: controller, href: href,);
                                      //     })
                                    },
                                  ),
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ]
        )
    );
  }

  void showAsBottomSheetForDesc(BuildContext context, String href) async {
    final result = await showSlidingBottomSheet(
        context,
        builder: (context) {
          return SlidingSheetDialog(
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.4, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return DescWidget(controller: controller, href: href,);
            },
          );
        }
    );
    print(result); // This is the result.
  }


}
