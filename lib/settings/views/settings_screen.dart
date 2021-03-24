import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/constants.dart';
import 'package:temur_tuzuklari/settings/controllers/settings_screen_controller.dart';

class SettingsScreen extends GetView<SettingsScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kTextSettings.tr),
        backgroundColor: Color(0xFF937245),
      ),
      body: Stack(
        children: [
          Obx(()=>Container(
            color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
          ),),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(kTextChangeLang.tr, style: TextStyle(fontSize: 18.0),),
                    Obx(() {
                      return DropdownButton<String>(
                        value: controller.dropDownValue.value,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.black54, fontSize: 18),
                        underline: Container(
                          height: 2,
                          color: Colors.black87,
                        ),
                        onChanged: (String data) {
                          controller.changeLang(data);
                        },
                        items: controller.spinnerItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      );
                    }

                    ),
                    //Switch(value: null, onChanged: null)
                  ],
                ),
              ),
              Obx(() {
                return Stack(
                  children: [
                    Container(
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
                                      controller.service.saveIsBold();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kColorMain,
                                          width: controller.service.isBold.value ? 0 : 2,
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
                                      controller.service.saveIsBold();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kColorMain,
                                          width: controller.service.isBold.value ? 2 : 0,
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
                                            Text(kTextBold.tr, textAlign: TextAlign.center, style: TextStyle(fontSize: 15),)
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
                                label: controller.service.sliderValue.value.round().toString(),
                                value: controller.service.sliderValue.value.toDouble(),
                                max: 30.0,
                                min: 17.0,
                                //onChangeEnd: (value) => print("Endi $value"),
                                onChanged: (value){
                                  //print(value.toInt());
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
                                      controller.service.saveIsRead();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kColorMain,
                                          width: controller.service.isRead.value ? 2 : 0,
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
                        )
                    ),
                  ],
                );
              }),
            ],
          ),
        ],
      )
    );
  }
}
