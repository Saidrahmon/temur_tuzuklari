import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';
import '../../constants.dart';

class BuildModalBottomSheetForDesc extends StatelessWidget {
  BuildModalBottomSheetForDesc({this.controller, this.href});

  final StoryScreenController controller;
  String href;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.mediaQuery.size.height*0.8,
      child: Material(
        child: InkWell(
          onTap: () => Navigator.pop(context, 'This is the result.'),
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Tavsif',
                              style: TextStyle(
                                  fontSize: controller.service.sliderValue.value.toDouble(),
                                  color: controller.service.isRead.value ? kColorMain.withOpacity(0.5) : kColorMain.withOpacity(0.8),
                                  fontWeight: controller.service.isBold.value ? FontWeight.w500 : FontWeight.normal
                              )
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(controller.getDescByKey(href),
                          style: TextStyle(
                              fontSize: controller.service.sliderValue.value.toDouble(),
                              color: controller.service.isRead.value ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.8),
                              fontWeight: controller.service.isBold.value ? FontWeight.w500 : FontWeight.normal
                          )
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}