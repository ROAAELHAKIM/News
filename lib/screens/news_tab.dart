import 'package:flutter/material.dart';
import 'package:news/screens/source_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../models/source_response.dart';

class NewsTab extends StatefulWidget {
  List<Sources>sources;
   NewsTab({super.key,required this.sources});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(length: widget.sources.length,
            child: TabBar(
              dividerColor: Colors.transparent,
              isScrollable: true,
                onTap: (value) {
                  selectedIndex=value;
                  setState(() {
        
                  });
                },
                indicatorColor: Colors.transparent,
                tabs:widget.sources.map((e) => Tab(
                  child:   SorceItem(source:e ,
                    isSelected: widget.sources.elementAt(selectedIndex)==e,
                  ),
                )).toList() )),
        FutureBuilder(future: ApiManager.getNewsData(widget.sources[selectedIndex].id?? ""),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              if(snapshot.hasError){
                return Center(child: Text("Someting Went Wrong"));
              }
              var articlesList=snapshot.data?.articles??[];
              if(articlesList.isEmpty){
                return Center(child: Text("NO SOURCES"));
              }
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                 return Text(articlesList[index].title??"    ");
                },
                itemCount: articlesList.length,
                ),
              );



            } )
      ],
    );
  }
}
