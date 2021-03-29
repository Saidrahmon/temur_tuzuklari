import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/services/ItemController.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';

import '../../constants.dart';

class BuildModalBotomSheetForSettings extends StatelessWidget {

  BuildModalBotomSheetForSettings({this.controller});

  AppService controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        constraints: BoxConstraints(maxWidth: 600),
        height: 350,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(kTextChangeShrift.tr, style: TextStyle(fontSize: 20.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      controller.saveIsBold();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kColorMain,
                          width: controller.isBold.value ? 0 : 2,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text('Aa', style: TextStyle(fontSize: 30),),
                            Text(kTextNormal.tr, textAlign: TextAlign.center,style: TextStyle(fontSize: 15),)
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
                      controller.saveIsBold();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kColorMain,
                          width: controller.isBold.value ? 2 : 0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              'Aa', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            Text(kTextDark.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)
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
                max: 30.0,
                min: 16.0,
                // onChangeEnd: (value) => print("Endi $value"),
                onChanged: (value){
                  //print(value.toInt());
                  controller.saveSliderValue(value.toInt());
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      controller.saveIsRead();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: kColorMain,
                            width: controller.isRead.value ? 0 : 2,
                          ),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white
                      ),
                      child: Text(kTextLight.tr, style: TextStyle(fontSize: 18, color: Colors.black87), textAlign: TextAlign.center,),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      controller.saveIsRead();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kColorMain,
                          width: controller.isRead.value ? 2 : 0,
                        ),
                        borderRadius: BorderRadius.circular(4),
                        color: kColorRead,
                      ),
                      child: Text(
                        kTextDark.tr, style: TextStyle(fontSize: 18, color: kColorMain), textAlign: TextAlign.center,),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: controller.isRead.value ? kColorIsRead : kColorIsNotRead,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
      );
    });
  }
}