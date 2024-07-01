import 'package:flutter/material.dart';

import '../shared/network/remote/api_manager.dart';
import 'news_tab.dart';
class DataTab extends StatelessWidget {
  String CategoryId;
   DataTab({required this.CategoryId,super.key});

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: ApiManager.getSources(CategoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Someting Went Wrong"));
        }
        var sourcesList = snapshot.data?.sources ?? [];
        if (sourcesList.isEmpty) {
          return Center(child: Text("NO SOURCES"));
        }

        return NewsTab(
          sources: sourcesList,
        );
      },
    );
  }
}
