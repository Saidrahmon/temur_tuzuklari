import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';
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
                showModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      BuildModalBotomSheetForSettings(controller: controller.service,),
                );
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

}

