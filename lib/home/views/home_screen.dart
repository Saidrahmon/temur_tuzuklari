import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:temur_tuzuklari/data/models/title_model.dart';
import 'package:temur_tuzuklari/home/contollers/home_screen_controller.dart';
import 'package:temur_tuzuklari/home/views/tab_list_widget.dart';

class HomeScreen extends GetView<HomeScreenController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(icon: Icons.info_outline,text: 'Temur tuzuklari haqida',),
            _createDrawerItem(icon: Icons.settings, text: 'Sozlamalar',),
            _createDrawerItem(icon: Icons.share, text: 'Ulashish',),
          ],
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool inner){
          return <Widget>[
            SliverAppBar(
              title: Text('Temur Tuzuklari'),
              backgroundColor: Color(0xFF937245),
              actions: [IconButton(
                  icon: Icon(Icons.search, color: Colors.white,),
                  onPressed: (){
                    showSearch(context: context, delegate: CustomDelegate(controller));
                  })
              ],
              floating: true,
              pinned: true,
              snap: true,
              bottom: TabBar(
                indicatorColor: Colors.white,
                controller: controller.tabController,
                tabs: [
                  Container(child: Text('Birinchi kitob', style: TextStyle(fontSize: 16),), padding: EdgeInsets.only(top: 10, bottom: 10),),
                  Container(child: Text('Ikkinchi kitob', style: TextStyle(fontSize: 16),), padding: EdgeInsets.only(top: 10, bottom: 10)),
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
  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:  AssetImage('assets/fon_header.jpg'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text('Temur Tuzuklari',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
  Widget _createDrawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

class CustomDelegate<T> extends SearchDelegate<T> {
  List<TitleModel> data;

  HomeScreenController homeScreenController;

  CustomDelegate(this.homeScreenController);

  @override
  List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.chevron_left), onPressed: () => close(context, null));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    List listToShow;
    if (query.isNotEmpty) listToShow = homeScreenController.allTitles.where((e) => e.title.toString().toLowerCase().contains(query.toLowerCase()) && e.title.toString().toLowerCase().startsWith(query.toLowerCase())).toList();
    else listToShow = homeScreenController.allTitles;

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        return ListTile(
          title: Text(listToShow[i].title),
          onTap: () {

          },
        );
      },
    );
  }
}

// TabBarView(
// children: [
// TabListWidget(controller.firstTitles),
// TabListWidget(controller.secondTitles),
// ],
// ),
