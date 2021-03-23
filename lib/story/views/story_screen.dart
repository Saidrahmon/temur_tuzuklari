import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../constants.dart';


class StoryScreen extends GetView<StoryScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,// <-- HERE
          selectedItemColor: Color(0xFF937245),
          unselectedItemColor: Color(0xFF937245),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_back_ios),
              label: 'Avvalgi kitob',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              label: 'Keyingi kitob',
            ),
          ],
          onTap: onTapped,
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool inner){
            return <Widget>[
              SliverAppBar(
                title: Text(kTitleApp.tr),
                backgroundColor: Color(0xFF937245),
                floating: true,
                snap: true,
                actions: [
                  myPopMenu(context, controller)
                ],
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
                                    color: Get.isDarkMode ? Colors.white : Color(0xFF937245),
                                    fontSize: (controller.sliderValue.value+6).toDouble(),
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
                                  fontSize: controller.sliderValue.value.toDouble(),
                                  color: controller.service.isRead.value ? Colors.black.withOpacity(0.5) : Colors.black.withOpacity(0.8)
                                )
                            ),
                            selectable: true,
                            data: this.controller.text.value,
                            onTapLink: (text, href, title) => {
                              showMaterialModalBottomSheet(
                                expand: false,
                                context: context,
                                backgroundColor: Colors.white,
                                builder: (context) =>
                                    SafeArea(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                                          child: Text(
                                              controller.getDescByKey(href),
                                              style: TextStyle(
                                                  fontSize: controller.sliderValue.value.toDouble()
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                              ),
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
      )
    );
  }

  void onTapped(int index){
    switch(index){
      case 0 : {
        this.controller.getPrevStory();
      }; break;
      case 1 : {
        this.controller.getNextStory();
      }; break;
    }
  }

  Widget myPopMenu(BuildContext context, StoryScreenController controller) {
    return PopupMenuButton(
        onSelected: (value) {
          if(value == 1){
            showMaterialModalBottomSheet(
              expand: false,
              context: context,
              backgroundColor: Colors.white,
              builder: (context) =>
                  Obx(() {
                    return Stack(
                      children: [
                        Container(
                            color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
                            height: 350,
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Harf o\'lchamini o\'zgartirish', style: TextStyle(fontSize: 20.0),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.isBold.value = false;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kColorMain,
                                              width: controller.isBold.value ? 0 : 2,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              children: [
                                                Text('Aa', style: TextStyle(fontSize: 30),),
                                                Text('Ingichka\nyozuv', textAlign: TextAlign.center,style: TextStyle(fontSize: 15),)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.isBold.value = true;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kColorMain,
                                              width: controller.isBold.value ? 2 : 0,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Aa', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                                ),
                                                Text('Qalin\nyozuv', textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  child: Slider(
                                    activeColor: Color(0xFF937245),
                                    divisions: 11,
                                    inactiveColor: Colors.grey,
                                    label: controller.sliderValue.value.round().toString(),
                                    value: controller.sliderValue.value.toDouble(),
                                    max: 25.0,
                                    min: 14.0,
                                    onChangeEnd: (value) => print("Endi $value"),
                                    onChanged: (value){
                                      print(value.toInt());
                                      controller.changeSliderValue(value.toInt());
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.service.saveIsRead();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: kColorMain,
                                                width: controller.service.isRead.value ? 0 : 2,
                                              ),
                                              borderRadius: BorderRadius.circular(12),
                                              color: Colors.white
                                          ),
                                          child: Text(' Yorug\' ', style: TextStyle(fontSize: 18, color: Colors.black87), textAlign: TextAlign.center,),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          controller.service.saveIsRead();
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: kColorMain,
                                              width: controller.service.isRead.value ? 2 : 0,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                            color: kColorRead,
                                          ),
                                          child: Text(
                                            'Qorong\'u', style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center,),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                        ),
                      ],
                    );
                  }),
            );
          }
        },
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  Text('harflar o\'chamini o\'zgartirish')
                ],
              )),
        ]
    );
  }
}


