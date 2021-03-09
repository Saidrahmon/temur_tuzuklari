import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';

import '../../app_routes.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen(){
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('Temur Tuzuklari'),
              bottom: TabBar(
                tabs: [
                  Text('Birinchi kitob'),
                  Text('Ikkinchi kitob'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                GetBuilder<HomeScreenController>(builder: (controller){
                  return ListView.builder(
                      itemCount: Get.find<HomeScreenController>().titles.length,
                      itemBuilder: (BuildContext context, int index){
                        return GestureDetector(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.navigate_next),
                                  Flexible(
                                    child: Text(
                                      Get.find<HomeScreenController>().titles[index],
                                      style: TextStyle(
                                        fontSize: 15.0
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          onTap: (){
                            Get.toNamed(Routes.STORY_SCREEN, arguments: Get.find<HomeScreenController>().titles[index]);
                          },
                        );
                      });
                }),
                Text('2'),
              ],
            ),
          ),
        ),
    );
  }
}
