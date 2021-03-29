import 'package:flutter/material.dart';
import 'package:temur_tuzuklari/data/models/title_model.dart';
import 'package:get/get.dart';

import '../../../app_routes.dart';

class TabListWidget extends StatelessWidget {

  List<TitleModel> list;

  TabListWidget(this.list);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 8.0,),
                      Icon(Icons.navigate_next),
                      SizedBox(width: 8.0,),
                      Flexible(
                        child: Text(
                          list[index].title,
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              onTap: (){
                Get.toNamed(Routes.STORY_SCREEN, arguments: [list[index].chapter, list[index].lang], );
              },
            );
          });
    });

  }
}