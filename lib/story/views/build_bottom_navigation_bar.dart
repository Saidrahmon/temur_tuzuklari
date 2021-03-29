import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';
import '../../constants.dart';
import 'build_modal_bottom_sheet_for_settings.dart';

class BuildBottomNavigationBar extends StatelessWidget {

  BuildBottomNavigationBar({this.controller});

  StoryScreenController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.hideButtonController,
      builder: (context, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: controller.hideButtonController.position.userScrollDirection == ScrollDirection.reverse ? 0: 56,
          child: child,
        );
      },
      child: SingleChildScrollView(
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
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
              icon: Icon(Icons.settings),
              label: 'Sozlamalar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward_ios_outlined),
              label: 'Keyingi kitob',
            ),
          ],
          onTap: (index){
            switch(index){
              case 0 : {
                this.controller.getPrevStory();
              }; break;
              case 1 : {
                showAsBottomSheetForSettings(context, controller);
                // showModalBottomSheet(
                //   context: context,
                //   builder: (context) =>
                //       BuildModalBotomSheetForSettings(controller: controller.service,),
                // );
                //bottomSheetDialog(context, controller);
              }; break;
              case 2 : {
                this.controller.getNextStory();
              }; break;
            }
          },
        ),
      ),
    );
  }
  void showAsBottomSheetForSettings(BuildContext context, StoryScreenController controller) async {
    final result = await showSlidingBottomSheet(
        context,
        builder: (context) {
          return SlidingSheetDialog(
            elevation: 8,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.6, 0.7, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 800),
                    height: Get.mediaQuery.size.height*0.6,
                    child: Material(
                      child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Obx(() {
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
                                      label: controller.service.sliderValue.value.round().toString(),
                                      value: controller.service.sliderValue.value.toDouble(),
                                      max: 30.0,
                                      min: 16.0,
                                      // onChangeEnd: (value) => print("Endi $value"),
                                      onChanged: (value){
                                        //print(value.toInt());
                                        controller.service.saveSliderValue(value.toInt());
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
                              ),
                              decoration: BoxDecoration(
                                  color: controller.service.isRead.value ? kColorIsRead : kColorIsNotRead,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)
                                  )
                              ),
                            );
                          })
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }
    );
    print(result); // This is the result.
  }
}

