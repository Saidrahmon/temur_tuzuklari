import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/constants.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';
import 'package:temur_tuzuklari/home/views/tab_list_widget.dart';
import 'build_drawer.dart';
import 'search_title.dart';

class HomeScreen extends GetView<HomeScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: BuildDrawer(controller: controller,),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner){
          return <Widget>[
            SliverAppBar(
              title: Text(kTitleApp.tr),
              backgroundColor: Color(0xFF937245),
              actions: [IconButton(
                  icon: Icon(Icons.search, color: Colors.white,),
                  onPressed: (){
                    showSearch(context: context, delegate: SearchTitle(controller));
                  })
              ],
              floating: true,
              pinned: true,
              snap: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                controller: controller.tabController,
                tabs: [
                  Container(child: Text(kTextFirstBook.tr, style: TextStyle(fontSize: 16),), padding: EdgeInsets.only(top: 10, bottom: 10),),
                  Container(child: Text(kTextSecondBook.tr, style: TextStyle(fontSize: 16),), padding: EdgeInsets.only(top: 10, bottom: 10)),
                ],
              ),
            )
          ];
        },
        body: TabBarView(
            controller: controller.tabController,
            children: [
              TabListWidget(controller.firstTitles),
              TabListWidget(controller.secondTitles),
            ],
          ),
        ),
    );
  }
}




