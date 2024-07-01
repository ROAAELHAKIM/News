import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news/models/Categorie_model.dart';
import 'package:news/screens/Categories_tab.dart';
import 'package:news/screens/data_tab.dart';
import 'package:news/screens/settings_tab.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../screens/home_drawer.dart';
import '../screens/news_tab.dart';

class Home extends StatefulWidget {
  static const String routeName = "Home";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     selectedWidget = Categories_tab( OnClick: onCategoryClick);
  }
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage("assets/images/pattern.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: HomeDrawer(itemClick: onMenuItemClick,),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          centerTitle: true,
          backgroundColor: Color(0xFF39A552),
          title: Text(
            "News App",
            style:
            TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body:selectedWidget,
      ),
    );
  }
late Widget selectedWidget;

  void onMenuItemClick(MenuItem Item) {
    switch (Item) {
      case MenuItem.Categories:
        {
          Navigator.pop(context);
          selectedWidget = Categories_tab( OnClick: onCategoryClick,);
          setState(() {

          });
        }
        break;
      case MenuItem.Settings:
        {
          Navigator.pop(context);
          selectedWidget = SettingsTab();
              setState(() {

              });
        }
        break;
    }
  }


  void onCategoryClick(CategorieModel categorieModel){
    selectedWidget=DataTab( category:categorieModel );
    setState(() {

    });
  }


}
