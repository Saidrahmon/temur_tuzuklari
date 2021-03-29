import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/models/title_model.dart';
import 'package:temur_tuzuklari/screens/home/contollers/home_screen_controller.dart';

import '../../../app_routes.dart';
import '../../../constants.dart';

class SearchTitle<T> extends SearchDelegate<T> {



  List<TitleModel> data;

  HomeScreenController homeScreenController;
  SearchTitle(this.homeScreenController);

  @override
  List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => Container(color: Colors.red,);

  @override
  Widget buildSuggestions(BuildContext context) {

    List listToShow;

    if (query.isNotEmpty) listToShow = homeScreenController.allTitles.where((e) => e.title.toString().toLowerCase().contains(query.toLowerCase()) && e.title.toString().toLowerCase().startsWith(query.toLowerCase())).toList();
    else listToShow = homeScreenController.allTitles;
    return listToShow.length == 0
        ? Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(kTextNothing.tr, style: TextStyle(fontSize: 18),),
              ],
            ),
            color: Colors.white,
         )
        : Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: listToShow.length,
        itemBuilder: (_, i) {
          return Container(
            color: Colors.white,
            child: ListTile(
              title: Text(listToShow[i].title, style: TextStyle(fontSize: 20),),
              onTap: () {
                Get.toNamed(Routes.STORY_SCREEN, arguments: [listToShow[i].chapter, listToShow[i].lang], );
              },
            ),
          );
        },
      ),
    );
  }
  @override
  String get searchFieldLabel => kTextSearch.tr;

  @override
  TextStyle get searchFieldStyle {
    return TextStyle(
        fontSize: 18,
        color: Colors.black54
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      //primaryTextTheme: theme.textTheme,
    );
  }





}