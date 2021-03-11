import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/local/db_helper_content.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';

import '../../app_routes.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  DrawerHeader(
                    child: Image(image: AssetImage('assets/header.jpeg'),fit: BoxFit.cover,),
                  ),
                  ListTile(
                    title: Text('Temur tuzulari haqida'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Sozlamalar'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Ulashish'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text('Dastur haqida'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              //leading: IconButton(icon: Icon(Icons.menu, color: Colors.white,), onPressed: null,),
              actions: [IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: null)],
              backgroundColor: Color(0xFF937245),
              title: Text('Temur Tuzuklari'),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Container(child: Text('Birinchi kitob', style: TextStyle(fontSize: 16),), padding: EdgeInsets.only(top: 10, bottom: 10),),
                  Container(child: Text('Ikkinchi kitob', style: TextStyle(fontSize: 16),), padding: EdgeInsets.only(top: 10, bottom: 10)),
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
