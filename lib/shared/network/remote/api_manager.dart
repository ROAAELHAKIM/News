import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/source_response.dart';
import 'package:news/shared/components/constants.dart';

import '../../../models/NewsResponse.dart';

class ApiManager{
//https://newsapi.org/v2/top-headlines/sources?apiKey=0d541a2cadd9461a82e205676d309c6a
 static Future<SourceResponse> getSources(String category)async{
  Uri url=Uri.https(
      "newsapi.org","/v2/top-headlines/sources",{
   "apiKey":"0d541a2cadd9461a82e205676d309c6a","category":category
  });
 http.Response respons =await http.get(url);
 Map<String,dynamic> json=jsonDecode(respons.body);
 return SourceResponse.fromJson(json);

 }
 static Future<NewsResponse> getNewsData(String sourceId)async{
  Uri url=Uri.https(Constants.Base_Url,"/v2/everything",{
   "sources":sourceId
  });
 var response=await http.get(url,headers:{"x-api-key":"0d541a2cadd9461a82e205676d309c6a"});
 var  json=jsonDecode(response.body);
  return NewsResponse.fromJson(json);



 }

}
