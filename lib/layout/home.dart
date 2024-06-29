import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../screens/news_tab.dart';

class Home extends StatelessWidget {
  static const String routeName = "Home";

  const Home({super.key});

  @override
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
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),bottomRight:Radius.circular(20)
          )),
          centerTitle: true,
          backgroundColor:Color(0xFF39A552) ,
          title: Text("News App",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ),),
      
      
        ),
        body: FutureBuilder(
          future: ApiManager.getSources(),
          builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child: Text("Someting Went Wrong"));
          }
          var sourcesList=snapshot.data?.sources??[];
          if(sourcesList.isEmpty){
           return Center(child: Text("NO SOURCES"));
          }
      
          return NewsTab(sources: sourcesList,);
      
        },),
      ),
    );
  }
}
