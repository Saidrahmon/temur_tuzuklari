import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/story/controllers/story_screen_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';


class StoryScreen extends GetView<StoryScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,   // <-- HERE
          showUnselectedLabels: false,
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
          // currentIndex: null,
          // selectedItemColor: Colors.amber[800],
          // onTap: _onItemTapped,
        ),
        body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner){
          return <Widget>[
            SliverAppBar(
              title: Text('Temur tuzuklari'),
              floating: true,
              backgroundColor: Color(0xFF937245),
              //pinned: true,
              snap: true,
            ),
          ];
        },
        body: SingleChildScrollView(
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
                                style: TextStyle(fontSize: 24.0, color: Color(0xFF937245), fontWeight: FontWeight.w500),
                              ),

                        );
                      }
                      ),
                    ),
                  ],
                ),
                Obx(() {
                  return Markdown(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    styleSheet: MarkdownStyleSheet(
                        p: TextStyle(fontSize: 16)
                    ),
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
              ],
          ),
        ),
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
}


